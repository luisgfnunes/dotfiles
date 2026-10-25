{ inputs, pkgs, lib, ... }: 
{
  home.username = "hikari";
  home.homeDirectory = "/home/hikari";
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
    kurve
    #obs-studio    
    #pkgsRocm.blender 
    ffmpeg-full

    # Jogos
    (prismlauncher.override {
      jdks = [
        jdk8
        jdk17
        jdk21
        jdk25
      ];
    })

    # Desenvolvimento & Programação
    vscode
    neovim
    python3
    proton-vpn
    wireguard-tools
    #inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity
    #inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-ide
 
    # Utilitários de Terminal & Sistema
    ripgrep
    fzf
    scrcpy
    android-tools
    dconf
    fuse3
  ];
 
  home.sessionVariables = {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    FLAKE = "/etc/nixos";

    # Força renderização Wayland nativa em apps Electron e Firefox
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
