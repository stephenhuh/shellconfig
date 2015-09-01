
# PURPOSE #
Use shellconfig to set your vim, vimrc, bash, bashrc, or other similar files quickly.
Ability to click on tmux panes.
tmux matches VIM keys

# Installation

    git clone <git-url> ~/.vim
    cd ~/.vim
    ./install.sh

	download powerline fonts from https://github.com/powerline/fonts
	set iTerm2 non-ascii fonts to inconsolata for powerline at 12pt
# Update
	
	cd ~/.vim/shellconfig
	./update.sh

##Important Files ##
files -- 
/.vim / *
/.vimrc
/.zshrc
/.tmux.conf
## My Selected Tools ##
####Texteditor: VIM ###
Pathogen
NERDTree
Ctrl P
Syntastic
Supertab
BadWolf Theme (Also able to use any theme within this vimrc)

####Shell: Zsh####
oh-my-zsh
nicoulaj theme

####Terminal####
iTerm2

####Additional:####
TMUX


## Need Moar Plugins
###Vundle like its 2015

Add a new plugin to your vimrc

		Plugin 'moar/plugin'
		:PluginInstall

Search for all or specific plugins inside of vim

		:PluginList

		:PluginList ack

VIM HOTKEYS TO REMEMBER
---
use w, b, e, ge to move back and forth.
no arrow keys to navigate
use t<char> shortcuts
leader key is space are great.
Nerdtree is <ldr> + n
open tabs within vims
http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
df? to delete to  a certain character
use gt and gT to scroll thru tabs
"*y "*p to copy and paste to and from clipboard
use visual mode scrolling to copy and paste

