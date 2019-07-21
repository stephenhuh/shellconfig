# PURPOSE [![](http://img.shields.io/badge/unicorn-approved-ff69b4.svg)](https://www.youtube.com/watch?v=9auOCbH5Ns4) [![](https://img.shields.io/badge/stevie.sh-approved-success.svg)](http://stevie.sh) ![](https://img.shields.io/badge/hours%20saved-1000s-blue.svg)
Use this shellconfig and this `README` to setup your `vim`, `bash`, `tmux`, `zsh`, `local/bin` and other core functionality for development + life quickly - mainly tested on OSX.

# Rationale
For anyone that questions why this setup.

	1. it forces you to learn lower level UNIX (see reason 2)
	2. NOTHING is magic if you stick with the setup for long enough. you learn how to create your own autocomplete, your		own go-to, etc. (this is prolly the biggest reason)
	3. fastest by far.
	4. far and wide compatibility -- can learn to be a sysadmin, a js-dev, a c-dev, a go-lang dev, a devops person, IT guy, etc.
	5. just simpler and easier.

However, there is a strong case to be made for easy setups that get you up and running in minutes and in autocompletion VIM still can't seem to compete. Try to learn the newer IDEs and fold back learnings into this repo to get the best of both worlds. VIM can usually match up to IDEs but IDEs can rarely match up to VIM in terms of speed + compatibility.

# Installation
	1. Use iTerm2 (https://www.iterm2.com/)
	2. Download vim-plug
	3. Clone this repo into ~/.vim
		$ cd ~/.vim
		$ git clone https://github.com/stephenhuh/shellconfig 
	4. Run the installer (and download all vundle packs automatically)
		$ cd ~/.vim/shellconfig
		$ ./install.sh
	5. Get Homebrew at brew.sh
	6. Get tmux 
		$ brew install tmux
  7. Get dracula theme for ITERM2
      $ git clone https://github.com/dracula/iterm.git
  8. Set vim as default git editor.
      $ git config --global core.editor `which vim`
  9. Make sure neovim works properly by running `:checkhealth` in nv
   

## Other
**Fonts Resources**: [fonts] (fonts/)

	1. download powerline fonts from https://github.com/powerline/fonts for perfect aligning and better reading
	2. set iTerm2 non-ascii fonts to Inconsolata for Powerline at 12pt 
	3. set iTerm2 ascii font to hack 12 pt 
	4. run some package manager install on tmux for that
	5. load up custom [snippets] (snippets.md) for my own snippets 
  6. (optional) If you want font ligatures use FiraCode - personally, they make programming a lil more confusing but I see the value if it's for more quantitative or math oriented languages

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
	
# HomeBrew packages
## This is a list of formulae you should have on OSX
1. `$brew install pidof`
2. `$brew install ngrok` 
3. `$brew install tree`
4. `brew install the_silver_searcher`
5. `brew install nmap`
6. `brew install watch` 

See below for GNU stuff

## Making Your Operating System more GNU Like
See: [Stack Exchange Link] (https://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities#comment211805_69223) for more info.

```
  0. brew install coreutils
  1. brew install findutils
  2. brew install binutils
  3. brew install gnu-tar
  4. brew install gnu-sed
  5. brew install gawk
  6. brew install gnutls
  7. brew install gnu-indent
  8. brew install gnu-getopt
  9. brew install grep
  10. brew install gnu-which
  11. brew install wdiff
  12. brew install wget
  13. brew install gdb
  14. brew install diffutils 

  Or just install them all at once with `brew install <formula1> <formula2> <formula3> ...`

  $brew search gnu - for other packages
```

Note that these utilites are all prefixed with g to avoid collision. To use without the 'g' add *gnubin* along with respective *gnuman pages* to path. This is, however *NOT RECOMMENDED* and may cause pain in the future, it is suggest to just use the 'g' prefix when GNU behavior is desired.

```
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
```

For more info just search through the info on the tools:
* `$brew info coreutils` - brew stuff
* `$info coreutils` - use gnu info for deeper dives into gnu utilities

## My Selected Tools
#### Texteditor: VIM
* oh-my-zsh - apple theme
* iTerm2
* TMUX
* koala for sass

## Need Moar Plugins
See vim-plug repo.

### On Colors:
* Made for Badwolf colorscheme -- colorschemes really don't matter in the end - but get em all lol
* can use flazz/vim-colorschemes to alter colorschemes and download em all at once.
* For GNOME shells get rid of powerline, use airline, then alias as shown in `install.sh`

VIM HOTKEYS TO REMEMBER
---
* note that vim is enabled for zsh
* use w, b, e, ge to move back and forth.
* no arrow keys to navigate
* use t<char> shortcuts
* leader key is space are great.
* Nerdtree is <ldr> + n  -- open with o
* CtrlP open with ctrl + o
* open tabs within vims
* http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
* df? to delete to  a certain character
* use gt and gT to scroll thru tabs
* use ctrl+w + o or s for new window splits
* "*y "*p to copy and paste to and from clipboard
* use visual mode scrolling to copy and paste
* `:reg` the killer register feature
* gD, gd, g*, g# for go-to like functionality


## Wicked Vim-specific things

```
autocmd BufWritePost * !./build.sh #set up commands to run upon writing
autocmd! #clear autocmds
```

* nerd tree can be used to make nodes with m+c or m+<?>
* jhkl -> navigation
* e,b E,B -> faster navigation
* dont use arrowkeys
* A, I insert mode in beginning or end of line
* $ and 0 move to beginning or end without going into insert
* o and O for insert line above below 
* u and ctrl+r -> undo and redo
* xp -> switch and replace two letters (x and p separately are useful as well)
* :bp, bn, etc -> buffer stuffj
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
* cw -> change word at cursor
* ciw -> change full word 

TMUX HOTKEYS TO REMEMBER
---
Session -> Window -> Panes
CTRL-A == Bind
* Bind + $ -> rename session
* Bind + w -> rename window
* Bind + c -> new tab
* Bind + n -> next tmux window
* Bind + j -> join pane from window
* Bind + s -> send pane to window
* Bind + R -> reload tmux config
* Bind + x -> kill current
* Bind + j -> join pane from..
* Bind + b -> send pane to...
* Bind + () -> move between sessions
* Bind : ls -> list all sessions.
* tmux ls, tmux detach, tmux attach
* Tmux is configured inside zsh

iTERM HOTKEYS TO REMEMBER
---
* CMD + / -> Find Cursor
* CMD + Arrows -> move between tabs

# Webstorm Config
Goal is to emulate personal vim setup but use Webstorm's best features e.g. autocomplete and go-to :(
- Use IDEAVIM, there should be a .rc file in this repo for this purpose.
- Use TMUX in the Terminal tab in Webstorm, should respond well in JetBrains software with ZSH and everything already setup if all other steps were finished.
- Use :e to abuse buffers.
- Shift-Shift is the way to go for CTRL-P like emulation

# General Apps for Development
## Multiple Browsers:
- Chrome Canary
- Firefox Developer Edition

## Programming Specific
- Sublime Text (for others to use)
- Bartender 3 - Clean Bars
- Alfred - Better Spotlight
- Dash - Offline Documentation
- JetBrains: Webstorm, C/C++ Lion, GoLand
- Transmit (FTP & SFTP)
- XCode - its going to happen sooner or later

## Security
- GPG Tools (https://gpgtools.org/) - so secure
- TorBrowser
- Magnet

## Other
- Textual - IRC
- DeskScribble - lifesaver during online presentations 
- Adobe CC - ur not just a programmer

