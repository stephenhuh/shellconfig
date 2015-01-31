#!/bin/bash
##########################
# shellconfig.sh
# this script creates symlinks from home directory to any desired dotfiles in ~/dotfiles
##########################


######### Variables
dir=~/shellconfig
olddir=~/shellconfig_old                         #old shellconfig backup directory
files="bashrc vimrc vim zshrc oh-my-zsh"      #list of files/folders to symlink in homedir

########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles riectory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

#move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done





