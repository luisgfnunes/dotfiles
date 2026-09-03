# 🌌 Dotfiles (Branch: Hyprland)
<img src="https://img.shields.io/badge/LINUX-Arch_Linux-1793D1?style=for-the-badge&logo=archlinux&logoColor=white" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/09102f8f-4401-4e33-8ff0-9c545b3c4888" />

Bem-vindo ao meu repositório pessoal de dotfiles! Esta branch contém o backup e a organização da minha configuração de sistema, focada em produtividade, minimalismo e um visual moderno.

## 🖥️ Meu Setup

* **Sistema Operacional:** Arch Linux
* **Compositor (Wayland):** [Hyprland](https://github.com/hyprwm/Hyprland)
* **Ambiente/Interface:** [Noctalia](https://github.com/noctalia-dev/noctalia)
* **Cursor:** Bibata Modern Ice

## ⚙️ Instalação Base

A instalação do ambiente e de suas dependências no Arch Linux pode ser feita utilizando os repositórios oficiais e o AUR (`pacman` / `yay` ou `paru`):

```bash
# Atualize o sistema
sudo pacman -Syu

# Pacotes essenciais do Hyprland e utilitários
sudo pacman -S hyprland hyprpaper hyprlock hypridle xdg-desktop-portal-hyprland \
                kitty qt5-wayland qt6-wayland nwg-look pipewire wireplumber brightnessctl

# Instale o Noctalia 
sudo pacman -S noctalia
```

## 📂 Estrutura Modular

Este repositório armazena as **minhas modificações e configurações pessoais**. A estrutura está organizada da seguinte forma:

* 📁 **`hypr/`**: Contém as configurações do compositor (atalhos de teclado, regras de layout, animações, regras de janelas e integração com o Noctalia).
* 📁 **`alacritty/`**: Configurações e temas do emulador de terminal.

## 🚀 Setup e Uso das Minhas Configurações

Para aplicar os meus ajustes específicos no seu sistema, clone esta branch e copie/vincule os arquivos para a sua pasta `~/.config`.
*Obs.: certifique-se de ajustar caminhos específicos do usuário se necessário.*

```bash
# Clone este repositório diretamente na branch do Hyprland
git clone -b dots/hypr https://github.com/LuisGFNunes/dotfiles.git ~/.dotfiles

# Entre no diretório
cd ~/.dotfiles

# Copie os diretórios de configuração para a pasta ~/.config
cp -r hypr ~/.config/
cp -r alacritty ~/.config/
```
