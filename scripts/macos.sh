#!/bin/bash

echo "Starting macOS configuration..."

# Dock: Mouse over highlight stack
defaults write com.apple.dock mouse-over-hilte-stack -bool true

# Dock: Orientation
defaults write com.apple.dock orientation -string "left"

# Dock: Tile size
defaults write com.apple.dock tilesize -float 32

# Dock: Magnification
defaults write com.apple.dock magnification -bool true

# Dock: Large size (magnified)
defaults write com.apple.dock largesize -int 58

# Dock: App Expose gesture
defaults write com.apple.dock showAppExposeGestureEnabled -int 1

# Dock: Hide recent apps
defaults write com.apple.dock show-recents -int 0

# Global: Key Repeat
defaults write NSGlobalDomain KeyRepeat -int 1

# Global: Show all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Battery: Show percent
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Clock: Date format "M月d日(EEE) H:mm"
defaults write com.apple.menuextra.clock DateFormat -string "M月d日(EEE) H:mm"

# Finder: Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Network: Don't write .DS_Store on network stores
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Trackpad: Tap to click (Bluetooth)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# Trackpad: Tap to click (Built-in)
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

echo "Restarting apps to apply changes..."
killall Dock
killall Finder

echo "macOS configuration complete."
