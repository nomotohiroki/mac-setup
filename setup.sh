#!/bin/bash

set -e

echo "========================================"
echo "Starting Mac Setup"
echo "========================================"

# Check and install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed."
fi

# Run Homebrew Bundle
if [[ -f "Brewfile" ]]; then
    echo "Installing packages from Brewfile..."
    brew bundle
else
    echo "Brewfile not found. Skipping package installation."
fi

# Run deployment script
if [[ -f "scripts/deploy.sh" ]]; then
    bash scripts/deploy.sh
fi

# Run macOS configuration script
if [[ -f "scripts/macos.sh" ]]; then
    bash scripts/macos.sh
fi

echo "========================================"
echo "Setup Complete!"
echo "========================================"