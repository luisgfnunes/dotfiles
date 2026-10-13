# ❄️ NixOS Configuration Flake

Minha configuração declarativa para **NixOS** gerenciada via **Nix Flakes**, **Disko** e o compositor Wayland **Umbriel** (do ecossistema Noctalia).

---

## 🛠️--- Arquitetura do Sistema ---
 
- **OS**: NixOS (Branch Unstable)
- **Gerenciador de Partição**: [Disko](https://github.com/nix-community/disko) (Btrfs com compressão `zstd`)
- **Compositor / Ambiente**: [Umbriel](https://github.com/noctalia-dev/umbriel)
- **Display Manager**: SDDM (Wayland)
- **Gerenciamento de Sistema**: Nix Flakes + Git

---

## --- Estrutura de Arquivos ---

```text
/etc/nixos/
├── flake.nix                  # Ponto de entrada das dependências e configurações
├── flake.lock                 # Trava de versões exatas das dependências
├── configuration.nix          # Configurações gerais do sistema e pacotes
├── hardware-configuration.nix # Módulos de kernel e drivers de hardware
└── disko-config.nix           # Esquema de particionamento Btrfs via Disko

```

---

## --- Comandos Rápidos ---

### 🔄 Reconstruir e aplicar alterações no sistema

```bash
cd /etc/nixos
git add .
sudo nixos-rebuild switch --flake .#nixos
```

### 📦 Atualizar todas as dependências (Flakes)

```bash
cd /etc/nixos
nix flake update
git add flake.lock
sudo nixos-rebuild switch --flake .#nixos
```

### 🧹 Limpar gerações antigas e liberar espaço em disco

```bash
sudo nix-collect-garbage -d
```

