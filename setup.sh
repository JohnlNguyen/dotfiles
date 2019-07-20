#!/bin/sh
mkdir -p ~/.dotfiles/backup

mv ~/.zshrc ~/.gitconfig ~/.vimrc ~/.tmux ~/.dotfiles/backup

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zfunc ~/.zfunc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux ~/.tmux
echo "Success! You now have John's configurations"
