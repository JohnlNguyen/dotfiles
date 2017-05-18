#!/bin/sh
exec 2>/dev/null
rm ~/.zshrc ~/.gitconfig ~/.vimrc ~/.tmux

git clone https://github.com/JohnlNguyen/dotfiles.git ~/.dotfiles
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zfunc ~/.zfunc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux ~/.tmux
echo "Success! You now have John's configurations"
sleep 1
curl -L http://bit.ly/10hA8iC | bash
