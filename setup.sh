#!/bin/sh
mkdir -p ~/.dotfiles/backup

mv ~/.zshrc ~/.gitconfig ~/.vimrc ~/.tmux ~/.dotfiles/backup

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

ln -s ./spaceship.zsh-theme "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ln -s ./zshrc ~/.zshrc
ln -s ./zfunc ~/.zfunc
ln -s ./gitconfig ~/.gitconfig
ln -s ./vimrc ~/.vimrc
ln -s ./tmux ~/.tmux
echo "Yeet all done"
