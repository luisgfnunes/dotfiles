{ config, lib, pkgs, inputs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./disko-config.nix
  ];

  # --- BOOT & KERNEL ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 4;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # --- REDE ---
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      checkReversePath = false;
      allowedTCPPorts = [ 80 443 22 ];
      allowedUDPPorts = [ 5353 ];
    };
  };

  # --- LOCALIZAÇÃO ---
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  # --- SNAPSHOTS (BTRFS) ---
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

  # --- UTILIZADORES ---
  users.users.blue = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
  };
  
  # --- AMBIENTE WAYLAND / XDG ---
  xdg.portal = {
    enable = true;
    wlr.enable = true; 
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "gtk" ];
      kde.default = [ "kde" "gtk" ];
      umbriel.default = [ "umbriel" "gtk" ];
    };
  };     
  
  # --- PACOTES GLOBAIS DE SISTEMA ---
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git
    gcc
    gnumake
    cmake
    wget
    curl
    unzip
    p7zip
    htop
    power-profiles-daemon
    wireplumber
    inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default # Aviso system corrigido aqui
  ];

  # --- FONTES ---
  fonts = {
    packages = with pkgs; [
      inter
      noto-fonts
      liberation_ttf
      nerd-fonts.jetbrains-mono
      fira-code
      font-awesome
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
    fontconfig = {
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
  };  

  # --- HARDWARE & SERVIÇOS ---
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sessionPackages = [ pkgs.umbriel ];  
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --cmd 'env XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=KDE startplasma-wayland'";
      user = "greeter";
    };
  };
  
  services.xserver.enable = true;
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
 
  # --- PROGRAMAS DO SISTEMA ---
  programs.firefox.enable = true;
  programs.umbriel.enable = true;
  programs.fish.enable = true;
 
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos";
  }; 
  
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;      
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # --- NIX SETTINGS & CACHES ---
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "blue" ];    
    substituters = [ "https://cache.nixos.org" "https://noctalia.cachix.org" ];
    trusted-public-keys = [ 
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" 
    ];
  };
 
  nix.extraOptions = ''
    !include /root/nix-github-token.conf
  '';

  system.stateVersion = "26.05"; 
}
