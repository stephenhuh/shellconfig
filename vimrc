
"" Pathogen compatibility

execute pathogen#infect()

"" Tabs and Indentation
set tabstop=4         " columns per tab
set shiftwidth=4      " hitting Tab in insert mode will produce the appropriate number of spaces
set softtabstop=4     "
set expandtab         " dont use spaces when tab is pressed.
set autoindent
set smartindent
""Basic Config
set colorcolumn=100   " highlights column specified
set number			  " display line numbers
set nocompatible	  " choose no compatibility with legacy vi
set ruler			  " always show current position
set cmdheight=2       " set height of the command bar

"" NERDTree Plugin Config
map <C-n> :NERDTreeToggle<CR> "map ctrl+n to launch NERDTree
set mouse=a                   "enable mouse control -- specifically for NERDTree

highlight ColorColum ctermbg=green guibg=green
filetype indent on
filetype plugin on
filetype indent on
syntax on
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
colorscheme mirodark
set t_Co=256
let g:solarized_termcolors=256

"" Searching

set hlsearch 	   " highlight matched results
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

"" Airline Plugin

"" Javascript stuff

"" Vim Javascript Plugin

let b:javascript_fold = 1

"" Syntastic Plugin

""angular syntastic compatibility
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

""Matching Tags

let g:mta_use_matchparen_group = 1

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'phtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \ 'server.view.html' : 1,
    \}
