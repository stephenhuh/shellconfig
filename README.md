# PURPOSE #
Use shellconfig to set your vim, vimrc, bash, bashrc, or other similar files quickly.

##Important Files ##
files -- 
/.vim / *
/.vimrc
/.zshrc
/.tmux.conf

## Other Info ##
Remember to set solarized add-on theme onto Terminal afterwards.
Was intended for use on OSX.

## My Selected Tools ##
####Texteditor: VIM ###
Pathogen
NERDTree
Ctrl P
Syntastic
Supertab
MiroDark Theme

####Shell: Zsh####
oh-my-zsh
nicoulaj theme

####Terminal####
iTerm2

####Additional:####
TMUX

<<<<<<< HEAD
[![](http://img.shields.io/badge/unicorn-approved-ff69b4.svg)](https://www.youtube.com/watch?v=9auOCbH5Ns4)

# Installation

    git clone http://github.com/zjrosen1/vim.git ~/.vim
    cd ~/.vim
    ./install.sh

## Need Moar Plugins
###Vundle like its 2015

Add a new plugin to your vimrc

		Plugin 'moar/plugin'
		:PluginInstall

Search for all or specific plugins inside of vim

		:PluginList

		:PluginList ack

NOTES
---
use w, b, e, ge to move back and forth.
no arrow keys to navigate
use t<char> shortcuts
leader keys are great.
open tabs within vims
http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
df? to delete to  a certain character
use gt and gT to scroll thru tabs
