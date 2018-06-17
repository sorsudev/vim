#!bin/bash

rm -rf ~/.vimrc ~/.vimrc.plugins ./tmp

Directory=./tmp
CurrentDirectory=$(pwd)
mkdir $Directory
mkdir $Directory/swap
mkdir $Directory/backup

#plugins
sudo apt-get install vim-command-t curl
npm install -g jshint

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/
cp .vimrc.plugins ~/

vim +PlugUpdate +qall

vim -u NONE -c "helptags ./plugins/vim-fugitive/doc" -c q
