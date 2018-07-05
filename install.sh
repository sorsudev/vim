#!bin/bash

rm -rf ~/.vimrc ~/.vimrc.plugins ./tmp

Directory=./tmp
CurrentDirectory=$(pwd)
mkdir $Directory
mkdir $Directory/swap
mkdir $Directory/backup

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install curl ruby2.3 ruby2.3-dev build-essential python-dev python3-dev libssl-dev vim-nox -y
npm install -g jshint

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/
cp .vimrc.plugins ~/

#plugins
vim +PlugUpdate +qall

cd ./plugins/command-t/ruby/command-t/ext/command-t
ruby extconf.rb && make

cd $CurrentDirectory

vim -u NONE -c "helptags ./plugins/vim-fugitive/doc" -c q
