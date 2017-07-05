#!bin/bash

rm ~/.vimrc
rm ~/.vimrc.plugins

cp .vimrc ~/
cp .vimrc.plugins ~/

Directory=./tmp
mkdir $Directory
mkdir $Directory/swap
mkdir $Directory/backup

#plugins
sudo apt-get update
sudo apt-get install build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh > nvm_install.sh
sh nvm_install.sh
. ~/.nvm/nvm.sh
. ~/.profile
. ~/.bashrc
nvm install node -v
nvm use node
npm install -g jshint

rm nvm_install.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall
./plugins/YouCompleteMe/install.py --tern-completer
