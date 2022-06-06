#!/bin/bash

# Update && Upgrade 
sudo apt update && sudo apt upgrade 

# Install essentials 
sudo apt install man vim htop neofetch git tmux curl

### Configs ###
# tmux
curl https://raw.githubusercontent.com/mxschardt/os-configs/main/.tmux.conf > ~/.tmux.conf
# vim 
curl https://raw.githubusercontent.com/mxschardt/os-configs/main/.vimrc > ~/.vimrc

### Terminal setup ### 

# Font and zsh
sudo apt install fonts-firacode zsh 

# Set zsh as default
chsh -s $(which zsh)

# Oh-my-zsh
ZSH_CUSTOM=$HOME"/.oh-my-zsh"	
git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH_CUSTOM
# curl https://raw.githubusercontent.com/mxschardt/os-configs/main/.zshrc > ~/.zshrc
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" $ZSH_CUSTOM/themes/spaceship.zsh-theme
sed -i "s/ZSH_THEME=\".*\"/ZSH_THEME=\"spaceship\"/g" ~/.zshrc

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i "s/plugins=(.*)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g" ~/.zshrc
