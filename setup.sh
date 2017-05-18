#!/bin/sh

rm ~/.zshrc ~/.gitconfig ~/.vimrc ~/.tmux

https://github.com/JohnlNguyen/dotfiles.git ~/.dotfiles
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zfunc ~/.zfunc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux ~/.tmux
echo "Success! You now have John's configurations"
