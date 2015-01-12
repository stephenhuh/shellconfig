
"" Tabs and Indentation
set tabstop=4         " columns per tab
set shiftwidth=4      " hitting Tab in insert mode will produce the appropriate number of spaces
set softtabstop=4     "
set expandtab         " dont use spaces when tab is pressed.
set smartindent
set autoindent
""Basic Config
set colorcolumn=80    " highlights column specified
set number			  " display line numbers
set nocompatible	  " choose no compatibility with legacy vi
set ruler			  " always show current position
set cmdheight=2       " set height of the command bar


"" Pathogen compatibility

execute pathogen#infect()

"" NERDTree Plugin Config
map <C-n> :NERDTreeToggle<CR> "map ctrl+n to launch NERDTree
set mouse=a                   "enable mouse control -- specifically for NERDTree


highlight ColorColumn ctermbg=darkgray " specify highlight color
filetype on
filetype plugin on
filetype indent on
syntax enable
set guifont=Menlo:h14

set laststatus=2
set linespace=3
set wrap
set textwidth=79
set formatoptions=qrn1
set incsearch
set exrc           " forces vim to source .vimrc file if present in working directory,
                   " providing place to store project  specific configuration
set secure         " restrict usage of some commands in non-default .vimrc files - esp write to file.

"" Colors
set background=dark
colorscheme solarized
set t_Co=16 
let g:solarized_termcolors=256

"" Searching

set hlsearch	   " highlight matched results
set incsearch	   " incremental searches
set ignorecase	   " searches are case insensitive
set smartcase	   " ... unless they contain one capital letter

"" Backups - Use Git and SVN instead.

set nobackup
set nowb
set noswapfile

"" Sounds
set noerrorbells
set novisualbell
set tm=500
