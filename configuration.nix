{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./disko-config.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 4;
 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.checkReversePath = false;
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  nix.settings.experimental-features = ["nix-command" "flakes" ];

  services.snapper = {
    snapshotInterval = "hourly";
    cleanupInterval = "1d";
    configs = {
      root = {
        SUBVOLUME = "/";
	ALLOW_USERS = [ "blue" ];
        TIMELINE_CREATE = true;
	TIMELINE_CLEANUP = true;
	TIMELINE_LIMIT_HOURLY = "6";
	TIMELINE_LIMIT_DAILY = "7";
	TIMELINE_LIMIT_WEEKLY = "2";
	TIMELINE_LIMIT_MONTHLY = "0";
      };
      home = {
        SUBVOLUME = "/home";
        ALLOW_USERS = [ "blue" ];
        TIMELINE_CREATE = true;
	TIMELINE_CLEANUP = true;
	TIMELINE_LIMIT_HOURLY = "6";
	TIMELINE_LIMIT_DAILY = "7";
	TIMELINE_LIMIT_WEEKLY = "2";
	TIMELINE_LIMIT_MONTHLY = "0";
      };
    };
  };

  users.users.blue = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      git
      vim
    ];
  };
  
  xdg.portal = {
    enable = true;
    wlr.enable = true; 
   
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };
      kde = {
        default = [ "kde" "gtk" ];
      };
      umbriel = {
        default = [ "umbriel" "gtk" ];
      };
    };
  };     
  
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # --- Navegadores & Comunicacao ---
    firefox
    fastfetch
    # --- Audio, Video e Midia ---
    pavucontrol
    wireplumber
    mpv
    cava
    grim
    slurp
    wl-clipboard
    # --- Desenvolvimento & Programacao
    git
    gcc
    gnumake
    cmake
    vscode
    neovim
    python3
    proton-vpn
    wireguard-tools
    # --- Utilitarios de Terminal & Sistema
    kitty
    ripgrep
    fzf
    htop
    unzip
    wget
    curl
    power-profiles-daemon
    p7zip
    scrcpy
    android-tools
    nwg-look
    inputs.umbriel.packages.${pkgs.system}.default
    # -- KDE Packages --- 
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark         
    kdePackages.breeze        
    kdePackages.breeze-icons
    kdePackages.knewstuff
    kdePackages.qtmultimedia
    kdePackages.qtsvg  
  ];

  fonts.packages = with pkgs; [
    # Interface e Web Geral
    inter
    noto-fonts
    liberation_ttf
    inter
    # Código e Ícones (Terminal)
    nerd-fonts.jetbrains-mono
    fira-code
    font-awesome
    # Suporte Internacional e Emojis
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif" "Liberation Serif" ];
      sansSerif = [ "Inter" "Noto Sans" "Liberation Sans" ];
      monospace = [ "JetBrains Mono" "Fira Code" ];
      emoji = [ "Noto Color Emoji" ];
    };
    
    subpixel = {
      rgba = "rgb";
      lcdfilter = "default";
    };
    hinting = {
      enable = true;
      style = "slight";
    };
  };  

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };
  
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sessionPackages = [ pkgs.umbriel ];  
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --cmd startplasma-wayland";
        user = "greeter";
      };
    };
  };
  
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  
  services.flatpak.enable = true; 
 
  programs.firefox.enable = true;
  programs.umbriel.enable = true;
  programs.fish.enable = true;
 
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos";
  }; 
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 22 ];
    allowedUDPPorts = [ 5353 ];
  };

  system.stateVersion = "26.05"; 
}

