# ❄️ NixOS Configuration Flake

Minha configuração declarativa para **NixOS** gerenciada via **Nix Flakes** e **Home Manager**, utilizando o **KDE Plasma 6** nativo no Wayland.

---

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2fb5c9d8-a691-4392-93ec-96635103bf8e" />

---

## 🛠️ Arquitetura do Sistema

- **OS**: NixOS (Branch Unstable)
- **Sistema de Arquivos**: BTRFS (subvolumes nativos) com compressão `zstd`
- **Compositor / Ambiente**: KDE Plasma 6 (Wayland)
- **Display Manager**: SDDM (Wayland)
- **Gerenciamento de Sistema**: Nix Flakes + Home Manager + **Nix Helper (nh)**

---

## 📂 Estrutura de Arquivos

```text
/etc/nixos/
├── flake.nix                  # Ponto de entrada das dependências (NixOS + Home Manager)
├── flake.lock                 # Trava de versões exatas das dependências
├── configuration.nix          # Configurações gerais do sistema, boot e pacotes
├── hardware-configuration.nix # Módulos de kernel, drivers e UUIDs do BTRFS
└── home.nix                   # Configurações, pacotes e variáveis de ambiente (username: hikari)

```

---

## 🚀 Comandos Rápidos (Nix Helper)

| Comando | O que faz |
| --- | --- |
| **`nh os switch`** | Aplica imediatamente qualquer alteração nos arquivos de configuração do sistema. |
| **`nh os switch -u`** | Atualiza os repositórios (`flake.lock`) e aplica as versões mais recentes dos programas. |
| **`nh os boot`** | Compila as alterações, mas só as ativa na próxima vez que o computador for iniciado. |
| **`nh os test`** | Aplica as configurações temporariamente (desfaz automaticamente se o PC for reiniciado). |
| **`nh clean all`** | Remove todas as gerações antigas do NixOS e do Home Manager para liberar espaço em disco. |
| **`nh clean all --keep 3`** | Executa a limpeza, mas preserva as últimas 3 versões do sistema no menu de boot por segurança. |
| **`nh search [pacote]`** | Realiza uma busca rápida por programas disponíveis no repositório do Nix. |
