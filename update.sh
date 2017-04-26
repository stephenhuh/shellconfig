clear
echo "Ready to update your shellconfig"
echo ""
while true; do
	read -p "Do you want to update your shellconfig?" yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/shellconfig/vimrc ~/.vimrc ;
			git submodule update --init ;
			vim +PluginInstall +qall
			break;;
		[Nn]* ) echo "Bye";
			exit;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
done
