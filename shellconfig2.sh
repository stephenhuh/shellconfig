#!/bin/bash
########################################################################
# shellconfig2.sh
# this is a much improved version of the old shellconfig.sh
# it accounts for possible errors and adds element of user interaction
#######################################################################

########## VARIABLES ################################################
dir=~/shellconfig
olddir=~/shellconfig_old
files="bashrc vimrc vim zshrc oh-my-zsh"
######################################################################

# create shellconfig_old inside homedir
echo "Creating $olddir for backup of any existing shellconfig files in ~"
if [-a ~/shellconfig]
    then echo "$olddir already exists!\n"
        echo "would you like to still create and overwrite $olddir? (y or n):"
         read decision
         if ["$decision" -eq "y"]
            then echo "you said yes"
            rm -rf $olddir
            mkdir -pv $olddir #verbose and path creation
         elif ["$decision" -eq "n"]
            then echo "you said no"
            exit
         else
            echo "invalid input"
            exit 1;
         fi
fi
echo "Creating the backup directory, $dir\n"
mkdir -pv $dir
echo "Let's back up your files now..."
cd ~ 
for file in $files; do
    echo "Backing up .$file\n"
    mv ~/.$file ~/$olddir
    if [-a ~/$dir/$file]
        echo "Moving into home .$file\n"
        mv ~/$dir/$file ~/.$file 
done

echo "everything's good to go!"
