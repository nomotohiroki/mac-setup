#!/bin/bash

echo "Starting file deployment..."

# Get the absolute path of the repository root
REPO_ROOT=$(cd "$(dirname "$0")/.." && pwd)
echo "Repository root: $REPO_ROOT"

# Create directories
echo "Creating directories..."
mkdir -p ~/projects
mkdir -p ~/.config

# Function to link config directories
link_config() {
    local name=$1
    echo "Linking $name config..."
    rm -rf ~/.config/"$name"
    ln -s "$REPO_ROOT/dotfiles/config/$name" ~/.config/"$name"
}

# Link XDG Configs
link_config "ghostty"
link_config "nvim"
link_config "sheldon"

# Link individual files
ln -sf "$REPO_ROOT/dotfiles/config/starship.toml" ~/.config/starship.toml

# Create symbolic links for dotfiles
echo "Creating symbolic links for dotfiles..."
ln -sf "$REPO_ROOT/dotfiles/zshrc" ~/.zshrc
ln -sf "$REPO_ROOT/dotfiles/vimrc" ~/.vimrc

# Copy App Configs (Legacy)
echo "Copying legacy app config files..."
mkdir -p ~/.config/karabiner
cp "$REPO_ROOT/app_config/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json
chmod 600 ~/.config/karabiner/karabiner.json

echo "File deployment complete."