" |-----------------------------|
" | Author: Stephen Huh         |
" | Email: stephenhuh@gmail.com |
" |-----------------------------|

" [ Vundle Setup ]{{{1
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Delimiter - Close Quotes, Brackets, Etc
Plugin 'raimondi/delimitmate'
" Github Wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
" Surround Text Shortcuts
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
" Commenting Shortcuts
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Visualize Undos
Plugin 'sjl/gundo.vim'
Plugin 'mattn/webapi-vim'
" Github Gist Wrapper
Plugin 'mattn/gist-vim'

Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'edkolev/promptline.vim'

Plugin 'tommcdo/vim-exchange'
Plugin 'terryma/vim-multiple-cursors'

" Code Completion using native search via tab
Plugin 'ervandew/supertab'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'gabesoft/vim-ags'
" Load Schemes Automatically
Plugin 'flazz/vim-colorschemes'

Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Sick Snippets - See Customs within Shellconfig
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'evidens/vim-twig'

" es6
Plugin 'isRuslan/vim-es6'

" vim-scripts
Plugin 'Tabular'
" File Explorer
Plugin 'ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'ack.vim'
" Seti Theme
Plugin 'trusktr/seti.vim'
" Syntax highlighting for Pug/Jade		
Plugin 'digitaltoad/vim-jade'		
" Elm Compilation and Formatting		
Plugin 'elmcast/elm-vim'
" CTags Viewer
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

"Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" Deprecated: Plugin 'kchmck/vim-coffee-script'
" Deprecated: Documentation Search via Dash
" Deprecated: Plugin 'rizzatti/dash.vim'
" Deprecated: Plugin 'tpope/vim-repeat'
" Deprecated: Plugin 'AndrewRadev/splitjoin.vim'

call vundle#end()

filetype plugin indent on

" [ Preferences ] {{{1
let mapleader = " "                    " Set global mapleader to space
set noswapfile
set autoindent
set smartindent
set hidden                             " Useful for auto setting hidden buffers
syntax enable                          " Enable syntax highlighting
set nostartofline                      " Don't reset cursor to start of line when moving around
set ttyfast
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
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
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
set background=dark
colorscheme badwolf
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
" Clean up nasty wysiwig html {{{2
" Install pandoc first
" https://code.google.com/p/pandoc/downloads/list

function! FormatprgLocal(filter)
if !empty(v:char)
return 1
else
let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
echo l:command
execute l:command
endif
endfunction

if has("autocmd")
let pandoc_pipeline  = "pandoc --from=html --to=markdown"
let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
endif
" [ Mappings ] {{{1
" Stuff {{{2

cmap w!! %!sudo tee> /dev/null %
command! W w												" Remap :W to :w

nnoremap Y y$												" Yank to end of line with Y
nnoremap D d$												" Delete to end of line with D

nmap _j vipJV"+yu										" For a SO question i answered, joins lines and copies to system clipboard

" like gv but for pasted text
" nnoremap <leader>v V`]

" Not sure about this one quite yet
" nnoremap ; :

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
inoremap fd <ESC>
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
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview 
 
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

" Syntax highlighting groups for word under cursor {{{2
" nmap <C-S-P> :call <SID>SynStack()<CR>
" function! <SID>SynStack()
" 	if !exists("*synstack")
" 		return
" 	endif
" 	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

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

" Fuck F1 one help to rule them all :h {{{2
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


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

" Set tabstop, softtabstop and shiftwidth to the same value {{{2
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expantab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
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

" Emmet {{{2
let g:user_emmet_leader_key = '<c-e>'
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
" Syntastic {{{2
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_python_python_exec = '/Library/Frameworks/Python.framework/Versions/3.6/bin/python3' 
nmap <leader>st :SyntasticToggleMode<cr>
let g:syntastic_javascript_checkers = ['jsxhint']
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
" Ag The Silver Searcher {{{2
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" JsDoc {{{2
nmap <silent> <leader>js <Plug>(jsdoc)
" Git Gutter {{{2
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
nmap <leader>gt :GitGutterToggle<cr>
" Some other syntax {{{2
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jade set filetype=html
au BufNewFile,BufRead *.pug set filetype=html
"}}} 
" [ Modeline ] {{{1
set modelines=1
" }}}
" [ C/C++ ] {{{1
" map <F8> :w <CR> :!gcc -std=c++1y % -o %< && ./%< <CR>
map <F9> :w <CR> :!cc % -o %< && ./%< <CR>
	set shell=bash\ -i		
" [ Elm ] {{{1		
let g:elm_format_autosave = 1		
" }}}		
" [ Project Specific VIMRC ] {{{1		
set exrc		
" }}
