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

A instalação do ambiente e de suas dependências no Arch Linux pode ser feita utilizando os repositórios oficiais:

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

Este repositório armazena as **minhas modificações e personalizações**, construídas sobre a base mantida pela equipe do **CachyOS**. A estrutura está organizada da seguinte forma:

**Descrição dos Diretórios**
* 📁 **`fastfetch/`**: Configurações de layout, temas e ícones da ferramenta de informações do sistema no terminal (`fastfetch`).
* 📁 **`gtk-3.0/`**: Temas, fontes, cursores e estilos customizados (CSS) para aplicações baseadas na biblioteca GTK 3.
* 📁 **`gtk-4.0/`**: Configurações de tema, esquemas de cores e estilização para programas que utilizam GTK 4 e Libadwaita.
* 📁 **`hypr/`**: Arquivos principais do compositor Hyprland (base CachyOS), contendo atalhos, regras de janelas, animações e atalhos do Noctalia.
* 📁 **`kitty/`**: Configurações do emulador de terminal Kitty, incluindo fontes, atalhos, opacidade e esquemas de cores.
* 📁 **`noctalia/`**: Arquivos de configuração, temas e módulos da sua interface/shell Noctalia.
* 📁 **`qt5ct/`**: Perfis e paletas de cores (`colors`) para forçar o tema do sistema em aplicações baseadas em Qt 5.
* 📁 **`qt6ct/`**: Configurações e temas para garantir a consistência visual em aplicativos modernos baseados em Qt 6.
* 📁 **`fastfetch/`**: Estilização do utilitário de informações do sistema via terminal.
* 📁 **`gtk-3.0/` & `gtk-4.0/`**: Definições de temas, cursores e estilo visual para aplicações GTK.
* 📁 **`hypr/`**: Configurações do compositor Hyprland (regras de janelas, binds, animações e scripts).
* 📁 **`kitty/`**: Personalização e temas do emulador de terminal Kitty.
* 📁 **`noctalia/`**: Configurações da shell/interface gráfica Noctalia.
* 📁 **`qt5ct/` & `qt6ct/`**: Modificadores de tema para uniformização visual de apps em Qt (Qt5 e Qt6).

## 🚀 Setup e Uso das Minhas Configurações

Para aplicar os meus ajustes no seu sistema, clone esta branch e copie os diretórios de configuração para a pasta `~/.config`:

```bash
# Clone este repositório diretamente na branch do Hyprland
git clone -b dots/hypr https://github.com/LuisGFNunes/dotfiles.git ~/.dotfiles

# Entre no diretório
cd ~/.dotfiles

# Copie todos os diretórios de configuração para a sua ~/.config
cp -r fastfetch gtk-3.0 gtk-4.0 hypr kitty noctalia qt5ct qt6ct ~/.config/
```

## 📜 Créditos

* **[CachyOS Hyprland Settings](https://github.com/CachyOS/cachyos-hyprland-settings):** Repositório base utilizado para a estrutura e configurações iniciais do Hyprland.
