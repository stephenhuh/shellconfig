" |-----------------------------|
" | Author: Stephen Huh         |
" | Email: stephenhuh@gmail.com |
" | Neovim config               |
" |-----------------------------|

" Plugin Manager:
" Note: Any plugin that can be largely replicated using core vim DO NOT
" INSTALL. Aim to sharpen the saw, not just add to it.
" Auto-install vim-plug

" Paths
let g:node_host_prog = '/usr/local/bin/neovim-node-host'
let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Start plugins:
call plug#begin('~/.config/nvim/plugged')

" Linting
Plug 'w0rp/ale'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" HTML/Others (Many)
Plug 'Shougo/neco-syntax'

" Typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript',       { 'do': './install.sh' }

" Vue
Plug 'posva/vim-vue'

" Fuzzy Finder
Plug 'junegunn/fzf.vim', { 'do' : {-> fzf#install() }}

" Delimiter - Close Quotes, Brackets, Etc
Plug 'raimondi/delimitmate'

" Github Wrapper
Plug 'tpope/vim-fugitive'

" Surround Text Shortcuts
Plug 'tpope/vim-surround'

" Commenting Shortcuts
Plug 'scrooloose/nerdtree'

" Syntax Checker
" Plug 'scrooloose/syntastic'

Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/promptline.vim'
Plug 'terryma/vim-multiple-cursors'

" Code Completion using native search via tab
" Plug 'ervandew/supertab'

" Load Schemes Automatically
Plug 'flazz/vim-colorschemes'

" Sick Snippets - See Customs within Shellconfig
Plug 'honza/vim-snippets'
Plug 'heavenshell/vim-jsdoc'
Plug 'evidens/vim-twig'

" Syntax highlighting for Pug/Jade		
Plug 'digitaltoad/vim-jade'		


" EMMET
Plug 'mattn/emmet-vim'
" Note comma still needed 
let g:user_emmet_leader_key='<leader>e'
" JSDoc

" CTags Viewer
"Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'

" Javascript, React, React Native
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mhartington/oceanic-next'
Plug 'valloric/MatchTagAlways'

call plug#end()

" Fuzzy Finding
nnoremap <C-p> :GitFiles<CR> 
set rtp+=/usr/local/opt/fzf

" Copying and Pasting 
" " Copy to clipboard using star register. (use :reg to see registers) 
vnoremap  <leader>y  "*y
nnoremap  <leader>Y  "*yg_
nnoremap  <leader>y  "*y
nnoremap  <leader>yy  "*yy

" " Paste from clipboard using star register.
nnoremap <leader>p "*p
nnoremap <leader>P "*P                  
vnoremap <leader>p "*p
vnoremap <leader>P "*P

" Disable F1, use :h instead.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Searching 
" " Set external grep utility to use ripgrep
if executable('rg')
  set grepprg=rg
endif


" Plugins:
" w0rp/ale 
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'jsx' : ['prettier', 'eslint'], 'javascript.jsx' : ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
nnoremap <C-g> :ALEGoToDefinition<CR> 
" autocmd BufWritePost *.ts !tslint % --fix
 
" Plug 'mhartington/nvim-typescript'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1

" Plug vim/jsx
let g:jsx_ext_required = 0

" Plug valloric/MatchTagAlways
let g:mta_filetypes = {'javascript.jsx' : 1}

" Plug emmet/vim
let g:user_emmet_leader_key='<C-E>'

" [ Preferences ] {{{1
let mapleader = " "                    " Set global mapleader to space
set noswapfile
set autoindent
set smartindent
set hidden                             " Useful for auto setting hidden buffers
syntax enable                          " Enable syntax highlighting
set nostartofline                      " Don't reset cursor to start of line when moving around
"set ttyfast                           " Default for neovim
set history=1000

" Reduce delay in switching modes
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" Needs time to process "j k" keys 
set timeoutlen=150 ttimeoutlen=0
" Searching/Moving {{{2
" nnoremap / /\v
" vnoremap / /\v
set gdefault                          " Add the g flag to search/replace by default
set incsearch                         " Highlight dynamically as pattern is typed
" set hlsearch
set ignorecase                        " Ignore case when searching
set smartcase                         " Try and be smart about cases
nnoremap j gj
nnoremap k gk
" Appearance {{{2
set number                          " Always show line numbers
set numberwidth=3                     " Changed the width of line number columns
set listchars=tab:\|\ ,trail:·,eol:¬  " Use new symbols for tabstops and EOLs
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set backspace=indent,eol,start
set showcmd                           " Shows incomplete command
execute "set colorcolumn=" . join(range(101,335), ',')
set novb noeb                         " Turn off visual bell and remove error beeps
set splitbelow                        " New window goes below
set splitright                        " New windows goes right
set wildmenu                          " Enhance command-line completion
set wildmode=longest:full,full
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*.DS_Store
set encoding=utf-8
set cursorline                        " Highlight current line
set laststatus=2                      " Always show the statusline
set t_Co=256                          " Explicitly tell Vim that the terminal supports 256 colors
" Colors and Theme {{{2
" " For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
 set termguicolors
endif

colorscheme BadWolf
" [ Auto Commands ] {{{1
" Auto source vimrc on save {{{2
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Restore cursor position {{{2
if has("autocmd")
filetype plugin indent on
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
endif


" Set filetype {{{2
if has("autocmd")
au BufNewFile,BufRead *.hbs set ft=html
endif
" Save on losing focus {{{2
au FocusLost * :wa
" Resize splits when window is resized {{{2
au VimResized * exe "normal! \<c-w>="
" [ Mappings ] {{{1
" Stuff {{{2

cmap w!! %!sudo tee> /dev/null %
command! W w												" Remap :W to :w

" :Wrap to wrap lines command! -nargs=* Wrap set wrap linebreak nolist

" Visual Selection {{{2

" Fix linewise visual selection of various text objects
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Don't move on *
nnoremap * *<c-o>

" Visually select the text that was last edited/pasted
nmap gV `[v`]


" Escaping {{{2
inoremap <C-c> <ESC>
inoremap jk <ESC>
" Enable esc for people using my computer lol
" vno v <esc>
" inoremap <esc> <NOP>
" Force quit that bitch
nmap fq :q!<CR>
" Filetype {{{2

nmap _ht :set ft=html<CR>
nmap _ph :set ft=php<CR>
nmap _py :set ft=python<CR>
nmap _rb :set ft=ruby<CR>
nmap _js :set ft=javascript<CR>
nmap _zs :set ft=zsh<CR>
nmap _md :set ft=mkd<CR>
nmap _vi :set ft=vim<CR>
nmap <F7> :TagbarToggle<CR>

" Folding {{{2
nnoremap <Tab> za
" Use leader z to "focus" the current fold
nnoremap <leader>z zMzvzz
" Auto load views
" http://vim.wikia.com/wiki/Make_views_automatic
" autocmd BufWinLeave *.* mkview!
" autocmd BufWinEnter *.* silent loadview 
 
" Bubble single lines {{{2
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Window Switching {{{2
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Window Resizing {{{2
" nnoremap <Left> :vertical resize +1<CR>
" nnoremap <Right> :vertical resize -1<CR>
" nnoremap <Up> :resize +1<CR>
" nnoremap <Down> :resize -1<CR>
" Insert Movement {{{2
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-f> <C-o>l
imap <C-b> <C-o>h
" Indent Mapping {{{2
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-[> >gv

" Viewport Scrolling {{{2
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Awesome fucking pasting {{{2
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



" [ Leader Mappings ] {{{1
" Save a file -- fs {{{2
nmap <leader>fs :w<CR>
" Update vimrc -- v OR ev {{{2
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Update snipmate -- sc {{{2
nmap <leader>sc :tabedit ~/.vim/bundle/vim-snippets/snippets<CR>
" Toggle Highlighting -- h {{{2
nmap <silent> <leader>h :set hlsearch!<CR>
" Toggle Spell Checking -- s {{{2
nmap <silent> <leader>s :set spell!<CR>

" Toggle set list -- l {{{2
nmap <Leader>l :set list!<CR>
" Ag -- a {{{2
nmap <Leader>a :Ags<SPACE>
" Surround selection with -- ` ' " {{{2
" Surround selection with backticks
nnoremap <leader>` 0v$S`
" Surround selection with "
nmap <leader>" viwS"
" Surround selection with '
nmap <leader>' viwS'
" Tab Editing {{{2
" Useful mappings for managing taps
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove<cr>
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Buffers {{{2
nmap <leader>T :enew<cr> 
" Move between buffer (Prefer default mappings)
nmap <leader>l :bnext<CR>"
nmap <leader>h :bprevious<CR>
" Show all open buffers
nmap <leader>bl :ls<CR>

" Extras for now {{{2

"Fold an html container
nnoremap <leader>ft Vatzf

"I think this sorts css
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
vnoremap <leader>y "*y

" Alphabetically sort CSS properties in file with :SortCSS
" :command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" [ Functions ]{{{1
" Remove trailing white space {{{2
function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Prune the arglist for matches
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
"	  Building a hash ensures we get each buffer only once
		let buffer_numbers = { }
		for quickfix_item in getqflist()
			let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
		endfor
		return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
	endfunction

" map <leader>t :call RunTestFile()<cr>
" map <leader>T :call RunNearestTest()<cr>
" Visual Mode */# from Scrooloose {{{2
function! s:VSetSearch()
	let temp = @@
	norm! gvy
	let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
	let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>

" [ Plugins ] {{{1
" SnipMate & DelimitMate Compatibiity {{{2
" Prevent S-Tab conflict with DelimitMate
imap <C-d> <Plug>snipMateBack
" vmath {{{2
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++
" Easy-motion {{{2
let g:EasyMotion_leader_key = ','
hi EasyMotionTarget ctermbg=none ctermfg=DarkRed
" hi EasyMotionShade  ctermbg=none ctermfg=DarkGray

"Fugitive Git {{{2
nmap <leader>ga :Git add -A<CR>
nmap <leader>gc :Gcommit -a<CR>
nmap <leader>gp :Git push<CR>
" CtrlP {{{2
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" MultipleCursors {{{2
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_quit_key='<C-c>'
" Mustache {{{2
let g:mustache_abbreviations = 1
" NerdTree {{{2
" autocmd vimenter * if !argc() | NERDTree | endif " Load NERDTree by default for directory

map <C-n><C-t> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
" Airline  {{{2
" comment line below to run on Ubuntu
let g:airline#extensions#tabline#enabled = 1

" Toggle errors
" Tabularize {{{2
if exists(":Tabularize")
	nmap <leader>t= :Tabularize /=<CR>
	vmap <leader>t= :Tabularize /=<CR>
	nmap <leader>t: :Tabularize /:\zs<CR>
	vmap <leader>t: :Tabularize /:\zs<CR>
	nmap <leader>t> :Tabularize /=><CR>
	vmap <leader>t> :Tabularize /=><CR>
endif

" JsDoc {{{2
nmap <silent> <leader>js <Plug>(jsdoc)
" From pangloss/vim-javascript plugin
let g:javascript_plugin_jsdoc = 1
" Git Gutter {{{2
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
nmap <leader>gt :GitGutterToggle<cr>
" Some other syntax {{{2
au BufNewFile,BufRead *.ejs set filetype=html
" au BufNewFile,BufRead *.jade set filetype=html
" au BufNewFile,BufRead *.pug set filetype=html
"}}} 
" [ Modeline ] {{{1
set modelines=1
" }}}
" [ C/C++ ] {{{1
" map <F8> :w <CR> :!gcc -std=c++1y % -o %< && ./%< <CR>
map <F9> :w <CR> :!cc % -o %< && ./%< <CR>
	set shell=bash\ -i		

" [ Project Specific VIMRC ] {{{1		
set exrc		
" }}
