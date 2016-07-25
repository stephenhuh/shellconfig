"line numbers
set list
set expandtab
set number
"column end
execute "set colorcolumn=" . join(range(101,335), ',')
"get rid of shitty <ESC>
inoremap jj <ESC>
inoremap jk <ESC>




