#!bin/bash

rm -rf ~/.vimrc ~/.vimrc.plugins ./tmp

Directory=./tmp
CurrentDirectory=$(pwd)
mkdir $Directory
mkdir $Directory/swap
mkdir $Directory/backup

#plugins
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install build-essential python-dev python3-dev libssl-dev gcc-6 vim-nox -y
npm install -g jshint

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/
cp .vimrc.plugins ~/

vim +PlugUpdate +qall

cd ./plugins/command-t/ruby/command-t/ext/command-t
CC=/usr/bin/gcc-6 rbenv install 2.3.3 -v
rbenv local 2.3.3
ruby extconf.rb && make

cd $CurrentDirectory

vim -u NONE -c "helptags ./plugins/vim-fugitive/doc" -c q
