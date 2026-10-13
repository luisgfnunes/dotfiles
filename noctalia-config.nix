{ inputs, ... }:
{
  # Importa o módulo disponibilizado pelo criador do Noctalia
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.username = "blue";
  home.homeDirectory = "/home/blue";
  home.stateVersion = "26.05";
   
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = true;
        # AJUSTE AQUI: coloque o caminho real para uma imagem válida
        # default.path = "/home/blue/Imagens/meu_wallpaper.png"; 
      };
    };
  };
}
