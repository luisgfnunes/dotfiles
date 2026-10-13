{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./disko-config.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
	
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

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
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [ "umbriel" "gtk" ];
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
    # --- Utilitarios de Terminal & Sistema
    kitty
    ripgrep
    fzf
    htop
    unzip
    wget
    curl
    power-profiles-daemon
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark      
    p7zip 
  ];

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

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
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
  services.upower.enable = false;

  programs.firefox.enable = true;
  programs.umbriel.enable = true;
  programs.fish.enable = true;
	
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 22 ];
    allowedUDPPorts = [ 5353 ];
  };

  system.stateVersion = "26.05"; 
}

