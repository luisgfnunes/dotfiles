{ inputs, pkgs, ... }: 
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  
  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  home.username = "blue";
  home.homeDirectory = "/home/blue";
  home.stateVersion = "26.05"; 

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  # --- CONFIGURAÇÕES DE TEMA BREEZE DARK ---
  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk; 
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
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
  };
  # -----------------------------------------
  programs.noctalia = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default; 
 
    settings = {
      # theme = {
      #   mode = "dark";
      #   source = "builtin";
      #   builtin = "Catppuccin";
      # };

      wallpaper = {
        enabled = true;
      };
    };
  }; 
}
