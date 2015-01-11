set number			  " display line numbers
set tabstop=4         " columns per tab
set shiftwidth=4      " hitting Tab in insert mode will produce the appropriate number of spaces
set softtabstop=4     "
set noexpandtab       " dont use spaces when tab is pressed.
set colorcolumn=80    " highlights column specified
set nocompatible	  " choose no compatibility with legacy vi


"" Pathogen and Plugins

execute pathogen#infect()

"" Config

highlight ColorColumn ctermbg=darkgray " specify highlight color
filetype on
filetype plugin on
filetype indent on
syntax enable
set guifont=Menlo:h14
set smartindent
set autoindent
set laststatus=2
set linespace=3
set wrap
set textwidth=79
set formatoptions=qrn1
set incsearch
set exrc           " forces vim to source .vimrc file if present in working directory,
                   " providing place to store project  specific configuration
set secure         " restrict usage of some commands in non-default .vimrc files - esp write to file.

"" Colors --> Solarized
set background=dark
colorscheme solarized
set t_Co=16 
let g:solarized_termcolors=256

"" Searching

set hlsearch	   " highlight matched results
set incsearch	   " incremental searches
set ignorecase	   " searches are case insensitive
set smartcase	   " ... unless they contain one capital letter


