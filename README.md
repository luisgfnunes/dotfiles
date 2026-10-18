# Dotfiles

Bem-vindo ao meu repositório de arquivos de configuração (dotfiles). Este repositório está estruturado em branches independentes para manter diferentes ambientes de trabalho separados, permitindo uma transição limpa entre diferentes compositores Wayland em diferentes distros Linux.

Selecione a branch correspondente ao ambiente que você deseja explorar ou instalar:

## Branches Disponíveis

### 1. [fedora](https://github.com/LuisGFNunes/dotfiles/tree/dots/niri)
Meu setup focado em navegação por scroll (scrollable tiling) e minimalismo.
* **Sistema Operacional:** Fedora Linux 44
* **Compositor (Wayland):** Niri
* **Ambiente/Interface:** Noctalia

### 2. [arch](https://github.com/LuisGFNunes/dotfiles/tree/dots/hypr)
Meu setup dinâmico, rico em animações e altamente customizado.
* **Sistema Operacional:** Arch Linux
* **Compositor (Wayland):** Hyprland
* **Ambiente/Interface:** Noctalia

### 3. [nix_os](https://github.com/LuisGFNunes/dotfiles/tree/dots/umbriel) [Setup Atual]
Meu setup declarativo-atômico focado em produtividade e estabilidade
* **Sistema Operacional:** NixOS
* **Compositor (Wayland):** KDE Plasma
* **Ambiente/Interface:** KWin

---

## Como utilizar

Para clonar e aplicar uma configuração específica na sua máquina (substitua os arquivos na sua pasta `~/.config`), utilize o parâmetro `-b` no Git para baixar diretamente a branch desejada:

```bash
# Para o ambiente fedora:
git clone -b fedora https://github.com/luisgfNunes/dotfiles.git ~/dotfiles

# Para o ambiente arch:
git clone -b arch https://github.com/luisgfnunes/dotfiles.git ~/dotfiles

# Para o ambiente nix_os:
git clone -b nix_os https://github.com/luisgfNunes/dotfiles.git ~/dotfiles
