# ❄️ NixOS Configuration Flake

Minha configuração declarativa para **NixOS** gerenciada via **Nix Flakes**, **Disko** e o compositor Wayland.

---

## 🛠️--- Arquitetura do Sistema ---

- **OS**: NixOS (Branch Unstable)
- **Gerenciador de Partição**: [Disko](https://github.com/nix-community/disko) (Btrfs com compressão `zstd`)
- **Compositor / Ambiente**: [Umbriel](https://github.com/noctalia-dev/umbriel)
- **Display Manager**: tuigreet (Wayland)
- **Gerenciamento de Sistema**: Nix Flakes + Git + **Nix Helper (nh)**


---

## --- Estrutura de Arquivos ---

```text
/etc/nixos/
├── flake.nix                  # Ponto de entrada das dependências e configurações
├── flake.lock                 # Trava de versões exatas das dependências
├── configuration.nix          # Configurações gerais do sistema e pacotes
├── hardware-configuration.nix # Módulos de kernel e drivers de hardware
├── disko-config.nix           # Esquema de particionamento Btrfs via Disko
└── noctalia-config.nix        # Configurações de usuário, temas (GTK/Qt) e Home Manager

```

---

## --- Comandos Rápidos (Nix Helper) ---

Comando | O que faz |
| --- | --- |
| **`nh os switch`** | Aplica imediatamente qualquer alteração nos arquivos de configuração do sistema. |
| **`nh os switch -u`** | Atualiza os repositórios (`flake.lock`) e aplica as versões mais recentes dos programas. |
| **`nh os boot`** | Compila as alterações, mas só as ativa na próxima vez que o computador for iniciado. |
| **`nh os test`** | Aplica as configurações temporariamente (desfaz automaticamente se o PC for reiniciado). |
| **`nh clean all`** | Remove todas as gerações antigas do NixOS e do Home Manager para liberar espaço em disco. |
| **`nh clean all --keep 3`** | Executa a limpeza, mas preserva as últimas 3 versões do sistema no menu de boot por segurança. |
| **`nh search [pacote]`** | Realiza uma busca rápida por programas disponíveis no repositório do Nix. |

```
