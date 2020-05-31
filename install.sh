#!/bin/bash

pp_done() {
  echo -e "\e[32mdone \e[33m:: \e[34m$1"
}

echo -e "\e[33mlinking \e[33mdotfiles..."

ln -sf ~/.dotfiles/init.vim ~/.config/nvim
pp_done "neovim"
ln -sf ~/.dotfiles/.tmux.conf ~
pp_done "tmux"
ln -sf ~/.dotfiles/config ~/.config/i3
pp_done "i3"
ln -sf ~/.dotfiles/i3blocks.conf ~/.config/i3
pp_done "i3blocks"
ln -sf ~/.dotfiles/.zshrc ~
pp_done "zsh"
mkdir -p ~/.scripts/startup
ln -sf ~/.dotfiles/load.sh ~/.scripts
pp_done "scripts"
ln -sf ~/.dotfiles/lock.sh ~
pp_done "lockscreen"

echo -e "\e[33mfinished"
