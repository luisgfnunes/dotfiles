{ inputs, pkgs, ... }: 
{
  home.username = "blue";
  home.homeDirectory = "/home/blue";
  home.stateVersion = "26.05"; 

  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;
    shellAbbrs = { "nh" = "NIX_CONFIG='experimental-features = nix-command flakes' nh"; };
  };  

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  # --- PACOTES DO UTILIZADOR ---
  home.packages = with pkgs; [
    # Navegadores & Comunicação
    fastfetch
    
    # Áudio, Vídeo e Mídia
    pavucontrol
    mpv
    cava
    grim
    slurp
    wl-clipboard
    nwg-look
    
    # Desenvolvimento & Programação
    vscode
    neovim
    python3
    proton-vpn
    wireguard-tools
    godot_4	
    
    # Utilitários de Terminal & Sistema
    kitty
    ripgrep
    fzf
    scrcpy
    android-tools
    
    # KDE Packages
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark         
    kdePackages.breeze        
    kdePackages.breeze-icons
    kdePackages.knewstuff
    kdePackages.qtmultimedia
    kdePackages.qtsvg  
  ];

  # --- CONFIGURAÇÕES DE TEMA BREEZE DARK ---
  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk; 
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
    cursorTheme = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = 24;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "breeze";
    style.package = pkgs.kdePackages.breeze;
  };

  home.sessionVariables = {
    GTK_THEME = "Breeze-Dark";
    NIX_CONFIG = "experimental-features = nix-command flakes";
    FLAKE = "/etc/nixos";
  };
}
