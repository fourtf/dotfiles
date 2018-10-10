" plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-commentary'
Plugin 'fatih/vim-go'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-sleuth'
call vundle#end()

" tabwidth 4
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" relative line numbers
set nu
set rnu

" disable swap files
set noswapfile

" remove delay when pressing O
set timeout ttimeoutlen=100

" split on right and bottom
set splitright
set splitbelow

" switch between header and source
map <F3> :call CurtineIncSw()<CR>
map <C-K> :NERDTreeToggle<CR>

" airline tabs
let g:airline#extensions#tabline#enabled = 1

" airline theme
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:airline_theme='simple'

" editor theme
syntax enable
set background=dark

" fix resizing screwing up the colors
autocmd VimResized * :redraw!

" youcompleteme
map <F2> :YcmCompleter GoTo<CR>
map <F1> :e#<CR>

" go imports
let g:go_fmt_command = "goimports"

" change split size
nmap <C-S-Left> :vertical resize -10<CR>
nmap <C-S-Right> :vertical resize +10<CR>
nmap <C-S-Up> :resize -5<CR>
nmap <C-S-Down> :resize +5<CR>
