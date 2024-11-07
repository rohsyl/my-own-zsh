#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" &> /dev/null
}

# Install Zsh if not installed
if ! command_exists zsh; then
  echo "Installing Zsh..."
  sudo apt update && sudo apt install -y zsh
else
  echo "Zsh is already installed."
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh is already installed."
fi

# Set Zsh as the default shell if not already set
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting Zsh as the default shell..."
  chsh -s "$(which zsh)"
else
  echo "Zsh is already the default shell."
fi

# Install plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install zsh-autosuggestions if not installed
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  echo "zsh-autosuggestions is already installed."
fi

# Install zsh-syntax-highlighting if not installed
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting is already installed."
fi

# Install zsh-bat if not installed
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-bat" ]; then
  echo "Installing zsh-bat..."
  git clone https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bat "$ZSH_CUSTOM/plugins/zsh-bat"
else
  echo "zsh-bat is already installed."
fi

# Enable plugins in the .zshrc file
echo "Enabling plugins in .zshrc..."
PLUGINS_LINE="plugins=(git npm node nvm docker zsh-autosuggestions zsh-syntax-highlighting zsh-bat)"
if ! grep -q "$PLUGINS_LINE" "$HOME/.zshrc"; then
  sed -i "/^plugins=/c\\$PLUGINS_LINE" "$HOME/.zshrc"
else
  echo "Plugins are already enabled in .zshrc."
fi

# Load changes
echo "Reloading .zshrc..."
source "$HOME/.zshrc"

echo "Setup complete! Please restart your terminal or run 'exec zsh' to start using Zsh."
