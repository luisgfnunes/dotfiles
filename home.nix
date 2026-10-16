{ inputs, pkgs, lib, ... }: 
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
    obs-studio    

    # Desenvolvimento & Programação
    vscode
    neovim
    python3
    proton-vpn
    wireguard-tools
    godot_4	
    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity
    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-ide
 
    # Utilitários de Terminal & Sistema
    nautilus
    ripgrep
    fzf
    scrcpy
    android-tools
    whitesur-icon-theme
    whitesur-gtk-theme
    dconf   
 
    # Pacotes do GNOME
    gnome-tweaks
    gnome-extension-manager
    # Extensões do GNOME
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes

  ];

  # --- CONFIGURAÇÕES DE TEMA GTK / GNOME ---
  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme;
    };
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
    cursorTheme = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = 24;
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "breeze_cursors";
    package = pkgs.kdePackages.breeze;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
 
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "breeze_cursors";
      size = 24;
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "WhiteSur";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "Vitals@CoreCoding.com"
        "dash-to-dock@micxgx.gmail.com"
        "User-Themes@fmuellner"
      ];
    };
  };
  
  home.file.".icons/default".source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors";

  home.sessionVariables = {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    FLAKE = "/etc/nixos";
  };
}
