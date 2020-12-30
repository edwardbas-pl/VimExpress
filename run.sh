#!/bin/bash

cd $HOME

if [[ ! -f /usr/bin/vim ]]
then
	if [[ -f /usr/bin/apt ]]
	then
		sudo apt update && sudo apt install vim  nodejs wget -y	
	fi	
	if [[ -f /usr/bin/pacman ]]
	then
		sudo pacman -Sy vim wget nodejs --noconfirm
	fi	
	if [[ -f /usr/bin/dnf ]]
	then
		sudo dnf update && sudo dnf install vim nodejs wget -y
	fi	
	if [[ -f /usr/bin/dnf ]]
	then
		sudo zypper --non-interactive install vim wget nodejs 
	fi	

fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

wget https://raw.githubusercontent.com/edwardbas-pl/backup/master/vimrc 
mv vimrc .vimrc

vim +PlugInstall +YcmRestartServer +qall

clear && echo "vim is ready to use"
