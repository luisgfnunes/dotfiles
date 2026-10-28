{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # --- BOOT & KERNEL ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # --- REDE & LOCALIZAÇÃO ---
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  console.keyMap = "br-abnt2";

  # --- AMBIENTE GRÁFICO (WAYLAND & PLASMA 6) ---
  services.xserver = {
    enable = true;
    xkb = {
      layout = "br";
      variant = "";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
  };
  services.desktopManager.plasma6.enable = true;

  # --- ÁUDIO & BLUETOOTH ---
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.flatpak.enable = true;
 

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # --- UTILIZADOR ---
  users.users."hikari" = {
    isNormalUser = true;
    description = "hikari";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # --- PACOTES GLOBAIS ---
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git gcc gnumake cmake wget curl unzip p7zip htop
  ];

  # --- FONTES ---
  fonts = {
    packages = with pkgs; [
      inter
      noto-fonts
      liberation_ttf
      nerd-fonts.jetbrains-mono
      fira-code
    ];
  };

  # --- PROGRAMAS & SERVIÇOS ---
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.nix-ld.enable = true;
  programs.appimage.binfmt = true; 
  
  # Biblioteca padrão para TODOS os apps genéricos/AppImages
  programs.nix-ld.libraries = with pkgs; [
    # Sistema e Core
    stdenv.cc.cc
    zlib
    fuse3
    expat
    e2fsprogs       
    libgcrypt       
    libgpg-error    
    
    # Fontes e Gráficos (O que barrou o MuseScore por último)
    fontconfig
    freetype
    libGL
    libGLU
    libxkbcommon
    dbus
    icu    

    # Áudio
    alsa-lib
    pipewire
    libjack2
    
    # Interface e Janelas (X11 e dependências comuns)
    glib
    nss
    nspr
    libX11
    libXext
    libXrender
    libXi
    libXtst
    libXcursor
    libXrandr
    libXinerama
    libXfixes
    libXdamage
    libXcomposite
    libICE
    libSM
  ];
 

  services.printing.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gamemode.enable = true;

  # --- NIX SETTINGS (FLAKES) ---
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "hikari" ];
  };
  nix.settings.auto-optimise-store = true;
  
  system.stateVersion = "26.05";
}
