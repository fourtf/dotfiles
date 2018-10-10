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
Plugin 'chiel92/vim-autoformat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'junegunn/vim-easy-align'
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

" disable word wrapping
set nowrap

" enable mouse
set mouse=a

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

" resize with alt+arrow keys
map <C-S-Left> :vertical resize -10<CR>
map <C-S-Right> :vertical resize +10<CR>
map <C-S-Up> :resize -7<CR>
map <C-S-Down> :resize +7<CR>

" allow editing over the file end
set virtualedit=block

" show line breaks
"set list

" clang-format on save
function! FormatOnSave()
  let l:formatdiff = 1
  Autoformat
endfunction
autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp call FormatOnSave()
