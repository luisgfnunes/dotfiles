# 🌌 Dotfiles (Branch: Hyprland)
<img src="https://img.shields.io/badge/LINUX-Fedora-blue?style=for-the-badge&logo=Fedora" />

<img width="1918" height="1078" alt="image" src="https://github.com/user-attachments/assets/b3af74bf-24f4-4a20-bddf-9c7bf5e693f1" />

Bem-vindo ao meu repositório pessoal de dotfiles! Esta branch contém o backup e a organização da minha configuração de sistema, focada em produtividade, minimalismo e um visual moderno.

## 🖥️ Meu Setup

* **Sistema Operacional:** Fedora Linux 44 (Workstation Edition)
* **Compositor (Wayland):** [Hyprland](https://github.com/hyprwm/Hyprland)
* **Ambiente/Interface:** [dots-hyprland (end-4)](https://github.com/end-4/dots-hyprland)
* **Cursor:** Bibata Modern Classic
* **Integração Flatpak:** Ajustes de permissão e variáveis de ambiente para que aplicativos em sandbox (como o Prism Launcher) respeitem o tema de janelas, ícones e o cursor do sistema nativamente.

## ⚙️ Instalação Base

A instalação do ambiente é feita através do script principal do end-4, que já possui suporte para detectar o Fedora, habilitar os repositórios Copr necessários e compilar as dependências locais via `dnf`:

```bash
# Atualize o sistema
sudo dnf upgrade --refresh

# Clone o repositório oficial do end-4
git clone https://github.com/end-4/dots-hyprland.git ~/.cache/dots-hyprland

# Execute o instalador
cd ~/.cache/dots-hyprland
./setup install

```

## 📂 Estrutura Modular

Este repositório armazena as **minhas modificações pessoais** aplicadas sobre a base do end-4. A estrutura está organizada da seguinte forma:

* 📁 **`hypr/`**: Contém as minhas configurações exclusivas do compositor (atalhos de teclado, regras de layout, animações e comportamentos de janelas).
* 📁 **`alacritty/`**: Configurações e temas do emulador de terminal.

## 🚀 Setup e Uso das Minhas Configurações

Para aplicar os meus ajustes específicos (após rodar o script de instalação base acima), você pode clonar esta branch e sobrescrever os arquivos na sua pasta `~/.config`.
*Obs.: alguns paths podem estar configurados com o meu user: "hikari".*

```bash
# Clone este repositório diretamente na branch do Hyprland
git clone -b dots/hypr https://github.com/LuisGFNunes/dotfiles.git ~/.dotfiles

# Entre no diretório
cd ~/.dotfiles

# Copie os diretórios modificados para a sua pasta de configurações
cp -r hypr ~/.config/
cp -r alacritty ~/.config/

```
