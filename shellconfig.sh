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
echo "********************************************************"
if [ -e "$HOME/$olddir" ]
    then echo "$olddir already exists!"
         read -p "would you like to overwrite $olddir? (y or n):" decision
         if [ "$decision" == "y" ]
            then echo "you said yes"
            rm -rf ~/$olddir
            echo "removed that dusty directory"
            mkdir -pv ~/$olddir #verbose and path creation
         elif [ "$decision" == "n" ]
            then echo "you said no"
                 echo "********************************************************"
            exit
         else
            echo "invalid input"
            exit 1;
         fi
fi
echo "Creating the backup directory, $olddir"
mkdir -pv ~/$olddir
echo "Let's back up your files now..."
for file in $files; do
    if [ -e "$HOME/.$file" ]
        then echo "Backing up .$file"
	         mv ~/.$file ~/$olddir/$file
	         echo "Now using new .$file"
       	     mv ~/$dir/$file ~/.$file
	else
	     echo ".$file doesnt exist already, skipping backup!"
         echo "Now using new .$file" 
	     cp -r ~/$dir/$file ~/.$file
    fi
done
echo "enjoy your new shell"
echo "remember to activate solarized in add-ons folder in .vim"
echo "********************************************************"
