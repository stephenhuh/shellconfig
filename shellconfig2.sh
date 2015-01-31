#!/bin/bash
########################################################################
# shellconfig2.sh
# this is a much improved version of the old shellconfig.sh
# it accounts for possible errors and adds element of user interaction
#######################################################################

########## VARIABLES ################################################
dir=shellconfig
olddir=shellconfig_old
files="vimrc vim"
######################################################################

# create shellconfig_old inside homedir
if [ -e "~/$olddir" ]
    then echo "$olddir already exists!"
         echo "would you like to still create and overwrite $olddir? (y or n):"
         read decision
         if [ "$decision" -eq "y" ]
            then echo "you said yes"
            rm -rf ~/$olddir
            mkdir -pv ~/$olddir #verbose and path creation
         elif [ "$decision" -eq "n" ]
            then echo "you said no"
            exit
         else
            echo "invalid input"
            exit 1;
         fi
fi
echo "Creating the backup directory, $dir"
mkdir -pv ~/$olddir
echo "Let's back up your files now..."
for file in $files; do
    if [ -e "~/.$file" ]
        then echo "Backing up .$file"
	         mv ~/.$file ~/$olddir/$file
	         echo "Now using new .$file\n"
       	     mv ~/$dir/$file ~/.$file
	else
	     echo ".$file doesnt exist already, skipping backup!"
         echo "Now using new .$file\n" 
	     cp ~/$dir/$file ~/.$file
    fi
done
echo "enjoy your new shell"
