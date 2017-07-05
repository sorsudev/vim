#!bin/bash

rm -rf ~/.vimrc ~/.vimrc.plugins ./tmp

Directory=./tmp
CurrentDirectory=$(pwd)
mkdir $Directory
mkdir $Directory/swap
mkdir $Directory/backup

#plugins
sudo apt-get update
sudo apt-get install build-essential libssl-dev vim-nox -y
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

cp .vimrc ~/
cp .vimrc.plugins ~/

vim +PlugUpdate +qall

cd ./plugins/command-t/ruby/command-t/ext/command-t
rbenv install 2.3.1 -v
rbenv local 2.3.1
ruby extconf.rb && make

cd $CurrentDirectory
cd ./plugins/YouCompleteMe
./install.py --tern-completer

cd $CurrentDirectory

vim -u NONE -c "helptags ./plugins/vim-fugitive/doc" -c q
