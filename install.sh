#/bin/bash -xe
# Setup Variables
DEST_NEOVIM_DIRECTORY=~/.config
NEOVIM_CONFIGURATION=init.vim
SOURCE_DIRECTORY=~/.vim/shellconfig

clear
asciiwelcome() {
cat << "EOT"

███████╗████████╗███████╗██████╗ ██╗  ██╗███████╗███╗   ██╗██╗  ██╗██╗   ██╗██╗  ██╗        
██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║  ██║██╔════╝████╗  ██║██║  ██║██║   ██║██║  ██║        
███████╗   ██║   █████╗  ██████╔╝███████║█████╗  ██╔██╗ ██║███████║██║   ██║███████║        
╚════██║   ██║   ██╔══╝  ██╔═══╝ ██╔══██║██╔══╝  ██║╚██╗██║██╔══██║██║   ██║██╔══██║        
███████║   ██║   ███████╗██║     ██║  ██║███████╗██║ ╚████║██║  ██║╚██████╔╝██║  ██║        
╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝        
                                                                                            
███████╗██╗  ██╗███████╗██╗     ██╗          ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗  
██╔════╝██║  ██║██╔════╝██║     ██║         ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝  
███████╗███████║█████╗  ██║     ██║         ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗ 
╚════██║██╔══██║██╔══╝  ██║     ██║         ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║ 
███████║██║  ██║███████╗███████╗███████╗    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝ 
╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  
                                                                                            
██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗                              
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝                              
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗                                
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝                                
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██╗██╗██╗██╗██╗██╗██╗██╗██╗██╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝

EOT
}

asciibye(){
cat << "EOT"
                           _,,ad8888888888bba,_
                        ,ad88888I888888888888888ba,
                      ,88888888I88888888888888888888a,
                    ,d888888888I8888888888888888888888b,
                   d88888PP"""" ""YY88888888888888888888b,
                 ,d88"'__,,--------,,,,.;ZZZY8888888888888,
                ,8IIl'"                ;;l"ZZZIII8888888888,
               ,I88l;'                  ;lZZZZZ888III8888888,
             ,II88Zl;.                  ;llZZZZZ888888I888888,
            ,II888Zl;.                .;;;;;lllZZZ888888I8888b
           ,II8888Z;;                 `;;;;;''llZZ8888888I8888,
           II88888Z;'                        .;lZZZ8888888I888b
           II88888Z; _,aaa,      .,aaaaa,__.l;llZZZ88888888I888
           II88888IZZZZZZZZZ,  .ZZZZZZZZZZZZZZ;llZZ88888888I888,
           II88888IZZ<'(@@>Z|  |ZZZ<'(@@>ZZZZ;;llZZ888888888I88I
          ,II88888;   `""" ;|  |ZZ; `"""     ;;llZ8888888888I888
          II888888l            `;;          .;llZZ8888888888I888,
         ,II888888Z;           ;;;        .;;llZZZ8888888888I888I
         III888888Zl;    ..,   `;;       ,;;lllZZZ88888888888I888
         II88888888Z;;...;(_    _)      ,;;;llZZZZ88888888888I888,
         II88888888Zl;;;;;' `--'Z;.   .,;;;;llZZZZ88888888888I888b
         ]I888888888Z;;;;'   ";llllll;..;;;lllZZZZ88888888888I8888,
         II888888888Zl.;;"Y88bd888P";;,..;lllZZZZZ88888888888I8888I
         II8888888888Zl;.; `"PPP";;;,..;lllZZZZZZZ88888888888I88888
         II888888888888Zl;;. `;;;l;;;;lllZZZZZZZZW88888888888I88888
         `II8888888888888Zl;.    ,;;lllZZZZZZZZWMZ88888888888I88888
          II8888888888888888ZbaalllZZZZZZZZZWWMZZZ8888888888I888888,
          `II88888888888888888b"WWZZZZZWWWMMZZZZZZI888888888I888888b
           `II88888888888888888;ZZMMMMMMZZZZZZZZllI888888888I8888888
            `II8888888888888888 `;lZZZZZZZZZZZlllll888888888I8888888,
             II8888888888888888, `;lllZZZZllllll;;.Y88888888I8888888b,
            ,II8888888888888888b   .;;lllllll;;;.;..88888888I88888888b,
            II888888888888888PZI;.  .`;;;.;;;..; ...88888888I8888888888,
            II888888888888PZ;;';;.   ;. .;.  .;. .. Y8888888I88888888888b,
           ,II888888888PZ;;'                        `8888888I8888888888888b,
           II888888888'                              888888I8888888888888888b
          ,II888888888                              ,888888I88888888888888888
         ,d88888888888                              d888888I8888888888ZZZZZZZ
      ,ad888888888888I                              8888888I8888ZZZZZZZZZZZZZ
    ,d888888888888888'                              888888IZZZZZZZZZZZZZZZZZZ
  ,d888888888888P'8P'                               Y888ZZZZZZZZZZZZZZZZZZZZZ
 ,8888888888888,  "                                 ,ZZZZZZZZZZZZZZZZZZZZZZZZ
d888888888888888,                                ,ZZZZZZZZZZZZZZZZZZZZZZZZZZZ
888888888888888888a,      _                    ,ZZZZZZZZZZZZZZZZZZZZ888888888
888888888888888888888ba,_d'                  ,ZZZZZZZZZZZZZZZZZ88888888888888
8888888888888888888888888888bbbaaa,,,______,ZZZZZZZZZZZZZZZ888888888888888888
88888888888888888888888888888888888888888ZZZZZZZZZZZZZZZ888888888888888888888
8888888888888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888888888
888888888888888888888888888888888888888ZZZZZZZZZZZZZZ888888888888888888888888
8888888888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888888888888
88888888888888888888888888888888888ZZZZZZZZZZZZZZ8888888888888888888888888888
8888888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888 Normand  88
88888888888888888888888888888888ZZZZZZZZZZZZZZ8888888888888888888 Veilleux 88
8888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888888888888888888
EOT

}


asciiwelcome
echo "Well congrats on taking the big step into my .vim config!"
echo "Before using this make sure your shellconfig repository is in ~/.vim"
echo "Before proceeding, if you want to keep your .vimrc then back that shit up!\n"

# Classic Vim
while true; do
  read -p "Do you want to install vimrc y or n (this is for vim classic not neovim)? " yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/.vim/shellconfig/vimrc ~/.vimrc ;
			git submodule update --init ;
			break;;
		[Nn]* ) echo "Skipping vimrc";
			break;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
	echo "We're done with vimrc"
	sleep 1
done

# NeoVim Stuff
while true; do
  echo "Do you want to install the vim configurations for NeoVim?" 
  read wants_neovim_config
  if [ ! -f init.vim ]; then
    echo "init.vim doesnt exist, exiting...";
    exit;
  fi
  if [[ $wants_neovim_config =~ Y|y|yes ]]; then
    echo "Configuring NeoVim"
    mkdir -p $DEST_NEOVIM_DIRECTORY && cp $SOURCE_DIRECTORY/$NEOVIM_CONFIGURATION $DEST_NEOVIM_DIRECTORY
    break
  elif [[ $wants_neovim_config =~ N|n ]]; then
    echo "Skipping Neovim Configuration";
    break;
  else
    echo "Please answer with a valid answer: Y|n or N|n"
  fi
done
while true; do
	read -p "Do you want to install tmux.conf y or n? " yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/.vim/shellconfig/tmux.conf ~/.tmux.conf ;
			break;;
		[Nn]* ) echo "Skipping tmux.conf";
			break;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
	echo "We're done with tmux.conf"
	sleep 1
done
while true; do
	read -p "Do you want to install zshrc y or n? " yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/.vim/shellconfig/zshrc ~/.zshrc ;
			break;;
		[Nn]* ) echo "Done with zshrc";
			break;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
	echo "We're done with zshrc"
	sleep 1
done
while true; do
	echo "We're going to add a tmux alias to your bashrc if you're on a GNOME terminal"
	read -p "Are you on an GNOME Terminal right now? y or n? " yn
	case $yn in
		[Yy]* ) 
			cat ~/.vim/shellconfig/bashrc >> ~/.bashrc
			break;;
		[Nn]* ) echo "Done with bash configs for GNOME terminals";
			break;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
	echo "We're done with bashrc"
	sleep 3
done
printf "\n\n\n\n"
asciibye
printf "\n\n\n\n"
echo "You have a kick-ass shell. Thanks for using shellconfig. Fork and star me"
