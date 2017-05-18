#!/bin/sh

rm ~/.zshrc ~/.gitconfig ~/.vimrc ~/.tmux

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zfunc ~/.zfunc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux ~/.tmux

