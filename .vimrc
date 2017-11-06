" tabwidth 4
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" relative line numbers
set nu
set rnu

" switch between header and source
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F3> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
