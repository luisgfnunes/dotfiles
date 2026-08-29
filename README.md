# 🌌 Dotfiles (Branch: Niri)
<img src="https://img.shields.io/badge/LINUX-Fedora-blue?style=for-the-badge&logo=Fedora" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ba4e59a4-17e4-456f-b893-ae931fe8003b" />

Bem-vindo ao meu repositório pessoal de dotfiles! Aqui você encontra o backup e a organização da minha configuração de sistema, focada em produtividade e minimalismo.

## 🖥️ Meu Setup

* **Sistema Operacional:** Fedora Linux 44 (Workstation Edition)
* **Compositor (Wayland):** [Niri](https://github.com/YaLTeR/niri)
* **Ambiente/Tema:** [Noctalia](https://github.com/noctalia-dev/noctalia)

## ⚙️ Instalação do WM e Shell
```bash
sudo dnf5 install niri
sudo dnf5 install noctalia # utiliza a v5 do repositorio oficial
```

## 📂 Estrutura Modular

Este repositório está organizado de forma modular para facilitar a manutenção e a aplicação das configurações:

* 📁 **`niri/`**: Contém todas as configurações exclusivas do compositor Niri (atalhos de teclado, regras de layout, animações e comportamentos de janelas).

## 🚀 Setup e Uso

Para aplicar estas configurações na sua máquina, você pode clonar este repositório e criar links simbólicos (symlinks) para a pasta `~/.config`, ou simplesmente copiar os arquivos.
Obs.: alguns paths podem estar configurados como meu user: "hikari"

```bash
# Clone este repositório
git clone https://github.com/LuisGFNunes/dotfiles.git ~/.dotfiles

# Entre no diretório
cd ~/.dotfiles

# Copie os diretórios para a sua pasta de configurações
cp -r niri ~/.config/
cp -r noctalia ~/.config/
cp -r alacritty ~/.config/
