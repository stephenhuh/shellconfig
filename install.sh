clear
echo "Well congrats on taking the big step into my .ViM config!"
echo ""
echo "If you want to keep your .vimrc then back that shit up!"
echo ""
while true; do
	read -p "Do you want to install vimrc y or n? " yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/.vim/shellconfig/vimrc ~/.vimrc ;
			git submodule update --init ;
			vim +PluginInstall +qall
			break;;
		[Nn]* ) echo "Done with vimrc";
			exit;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
done
while true; do
	read -p "Do you want to install tmux.conf y or n? " yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/.vim/shellconfig/tmux.conf ~/.tmux.conf ;
			break;;
		[Nn]* ) echo "Done with tmux.conf";
			exit;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
done
while true; do
	read -p "Do you want to install zshrc y or n? " yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/.vim/shellconfig/zshrc ~/.zshrc ;
			break;;
		[Nn]* ) echo "Done with tmux.conf";
			exit;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
done
