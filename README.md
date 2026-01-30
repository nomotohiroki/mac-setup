# mac-setup

A modern, lightweight, and high-performance macOS development environment setup, designed for Full-stack Engineers and Tech Leads.

Moving away from heavy configuration management tools like Ansible, this project adopts a **"Homebrew Bundle + Shell Scripts"** architecture to ensure speed, portability, and easy maintenance.

## 🚀 Philosophy

- **Speed First**: GPU-accelerated terminal (Ghostty), Rust-based CLI tools (`eza`, `bat`, `ripgrep`), and a lightweight Neovim config.
- **Modern Standards**: Fully XDG Base Directory (`~/.config`) compliant.
- **Declarative**: All packages managed via `Brewfile`.
- **Minimalist**: Replaces complex Ansible roles with simple, readable shell scripts.

## 🛠 Tech Stack

### Core Environment
- **Terminal**: [Ghostty](https://ghostty.org/) (GPU-accelerated, native macOS feel)
- **Shell**: Zsh + [Starship](https://starship.rs/) (Fast, customizable prompt)
- **Editor**: [Neovim](https://neovim.io/) (Lua-based, pre-configured with Lazy.nvim, LSP, Treesitter)

### Rust-based CLI Tools
This setup replaces legacy Unix commands with modern Rust alternatives:
- `ls` → **[eza](https://github.com/eza-community/eza)** (Icons, Git status)
- `cat` → **[bat](https://github.com/sharkdp/bat)** (Syntax highlighting)
- `grep` → **[ripgrep (rg)](https://github.com/BurntSushi/ripgrep)** (Blazing fast search)
- `find` → **[fd](https://github.com/sharkdp/fd)** (User-friendly find)
- `cd` → **[zoxide](https://github.com/ajeetdsouza/zoxide)** (Smarter directory navigation)
- `git` → **[lazygit](https://github.com/jesseduffield/lazygit)** (Terminal UI for Git)

### Runtime Management
- **[mise](https://github.com/jdx/mise)**: Replaces `anyenv`, `nvm`, `pyenv`, etc., for managing Node.js, Go, Python versions.

## 📦 Installation

### 1. Clone & Setup
```bash
git clone https://github.com/nomotohiroki/mac-setup.git
cd mac-setup
./setup.sh
```

### 2. What `setup.sh` does
1.  **Homebrew**: Checks/Installs Homebrew.
2.  **Packages**: Installs CLI tools and Apps via `Brewfile` (`brew bundle`).
3.  **Deployment**: Links config files to `~/.config` and `~/.zshrc` (via `scripts/deploy.sh`).
4.  **System Settings**: Applies sensible macOS defaults (Dock, Finder, KeyRepeat) via `scripts/macos.sh`.

## 📂 Directory Structure

```text
.
├── Brewfile            # All packages and apps (Homebrew Bundle)
├── setup.sh            # Main installer script
├── scripts/
│   ├── deploy.sh       # Symlinks dotfiles to ~/.config & ~
│   └── macos.sh        # 'defaults write' system configurations
├── dotfiles/
│   ├── zshrc           # Zsh configuration
│   ├── vimrc           # Legacy Vim config
│   └── config/         # XDG compliant configs
│       ├── ghostty/    # Ghostty config
│       ├── nvim/       # Neovim (init.lua)
│       ├── starship.toml
│       └── sheldon/
└── app_config/         # Other app specific configs
```

## 🎨 Customization

- **Packages**: Edit `Brewfile` to add/remove tools or apps.
- **Aliases/Shell**: Edit `dotfiles/zshrc`.
- **Editor**: Edit `dotfiles/config/nvim/init.lua`.
- **System Defaults**: Edit `scripts/macos.sh`.

## 🔄 Updates

To update your environment (brew packages and config links), simply run:

```bash
./setup.sh
```