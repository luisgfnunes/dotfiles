{ inputs, pkgs, lib, ... }: 
{
  home.username = "blue";
  home.homeDirectory = "/home/blue";
  home.stateVersion = "26.05"; 
 
  programs.home-manager.enable = true;
  programs.fish.enable = true;

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
    dconf   
  ];
 
  home.sessionVariables = {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    FLAKE = "/etc/nixos";
  };
}
