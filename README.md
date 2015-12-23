[![](http://img.shields.io/badge/unicorn-approved-ff69b4.svg)](https://www.youtube.com/watch?v=9auOCbH5Ns4)
# PURPOSE 
Use stephenhuh's (forked from zjrosen)
shellconfig to set your vim, vimrc, bash, bashrc, or other similar files quickly.

Ability to click on tmux panes.
tmux matches VIM keys

# Installation

	Prereq: Use iTerm2 (https://www.iterm2.com/)
	1. Download Vundle First.
		$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	2. Clone this repo into ~/.vim
		$ cd ~/.vim
		$ git clone https://github.com/stephenhuh/shellconfig 
	3. Run the installer (and download all vundle packs automatically)
		$ cd ~/.vim/shellconfig
		$ ./install.sh
	4. Get Homebrew at brew.sh
	5. Get tmux 
		$ brew install tmux

##Other

	download powerline fonts from https://github.com/powerline/fonts for perfect aligning and better reading
	set iTerm2 non-ascii fonts to inconsolata for powerline at 12pt
	set iTerm2 ascii font to hack 12 pt (preferred)


# Update
	1. git clone vundle first
		$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	2. Run install script
		$ cd ~/.vim
		$ ./install.sh

	3. If you need powerline fonts
		download powerline fonts from https://github.com/powerline/fonts
		set iTerm2 non-ascii fonts to inconsolata for powerline at 12pt
		set iTerm2 ascii font to hack 12 pt (preferred)
	
	4. If powerline is incompatible with your shell comment out powerline font lines as written in the vimrc (GNOME in particular)

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
can use flazz/vim-colorschemes to alter colorschemes
For GNOME shells get rid of powerline, use airline, then alias as allowed in installscript


VIM HOTKEYS TO REMEMBER
---
* jhkl -> navigation
* e,b E,B -> faster navigation
* dont use arrowkeys
* A, I insert mode in beginning or end of line
* $ and 0 move to beginning or end without going into insert
* o and O for insert line above below 
* u and ctrl+r -> undo and redo
* xp -> switch and replace two letters (x and p separately are useful as well)
* r -> replace single character
* gt, gT -> go back and forth between vim tabs
* Nerdtree -> <ldr> + n with m+<?> for creating nodes
* "*p  "*y --> paste and copy to clipboard
* df<?> -> delete to character
* / and ? -> search forward and backward for words with n and N for tabbing thru
* dG -> delete from current to end of file
* gg -> go to first line of file
* G -> go to end of file
* % -> go to other bracket, other quote, etc
* zf, zo for code folding
* f<?>, F<?> skip to ? char - forward and backwards

TMUX HOTKEYS TO REMEMBER
---
CTRL-A == Bind
* Bind + hjkl
* Bind + c -> new tab
* Bind + n -> next tmux window
* Bind + j -> join pane from window
* Bind + s -> send pane to window
