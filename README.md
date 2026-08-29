# Dotfiles

Bem-vindo ao meu repositório de arquivos de configuração (dotfiles). Este repositório está estruturado em branches independentes para manter diferentes ambientes de trabalho separados, permitindo uma transição limpa entre diferentes compositores Wayland no Fedora Linux.

Selecione a branch correspondente ao ambiente que você deseja explorar ou instalar:

## Branches Disponíveis

### 1. [dots/niri](https://github.com/LuisGFNunes/dotfiles/tree/dots/niri)
Meu setup focado em navegação por scroll (scrollable tiling) e minimalismo.
* **Sistema Operacional:** Fedora Linux 44
* **Compositor (Wayland):** Niri
* **Ambiente/Interface:** Noctalia

### 2. [dots/hypr](https://github.com/LuisGFNunes/dotfiles/tree/dots/hypr)
Meu setup dinâmico, rico em animações e altamente customizado.
* **Sistema Operacional:** Fedora Linux 44
* **Compositor (Wayland):** Hyprland
* **Ambiente/Interface:** dots-hyprland (end-4)

---

## Como utilizar

Para clonar e aplicar uma configuração específica na sua máquina (substitua os arquivos na sua pasta `~/.config`), utilize o parâmetro `-b` no Git para baixar diretamente a branch desejada:

```bash
# Para o ambiente Niri:
git clone -b dots/niri https://github.com/LuisGFNunes/dotfiles.git ~/.dotfiles

# Para o ambiente Hyprland:
git clone -b dots/hypr https://github.com/LuisGFNunes/dotfiles.git ~/.dotfiles
