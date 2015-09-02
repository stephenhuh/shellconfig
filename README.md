[![](http://img.shields.io/badge/unicorn-approved-ff69b4.svg)](https://www.youtube.com/watch?v=9auOCbH5Ns4)
# PURPOSE 
Use stephenhuh's (forked from zjrosen)
shellconfig to set your vim, vimrc, bash, bashrc, or other similar files quickly.

Ability to click on tmux panes.
tmux matches VIM keys

# Installation

	1. git clone vundle first
		$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	2. Run install script
		$ cd ~/.vim
		$ ./install.sh

	3. If you need powerline fonts
		download powerline fonts from https://github.com/powerline/fonts
		set iTerm2 non-ascii fonts to inconsolata for powerline at 12pt
		set iTerm2 ascii font to hack 12 pt (preferred)
	
	4. If powerline is incompatible with your shell comment out powerline font lines as written in the vimrc

# Update (Coming soon)
	
	cd ~/.vim/shellconfig
	./update.sh

##Important Files
files -- 
/.vim / *
/.vimrc
/.zshrc
/.tmux.conf
## My Selected Tools
####Texteditor: VIM
Pathogen
NERDTree
Ctrl P
Syntastic
Supertab
BadWolf Theme (Also able to use any theme within this vimrc)

####Shell: Zsh
oh-my-zsh
nicoulaj theme

####Terminal
iTerm2

####Additional:
TMUX


## Need Moar Plugins
###Vundle like its 2015

Add a new plugin to your vimrc

		Plugin 'moar/plugin'
		:PluginInstall

Search for all or specific plugins inside of vim

		:PluginList

		:PluginList ack

####NOTES:
Made for Badwolf colorscheme
can use flazz/vim-colorschemes to alter


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

