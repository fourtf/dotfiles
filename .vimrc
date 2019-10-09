" plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Powerline, buffers on top + info on bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Fuzzy search for files (Ctrl+P)
Plugin 'ctrlpvim/ctrlp.vim'

" Switch between source/header files in C++ (F4)
Plugin 'ericcurtin/CurtineIncSw.vim'

" Open project tree (Ctrl+K)
Plugin 'scrooloose/nerdtree'

" Comment lines (gcc or Ctrl+//)
Plugin 'tomtom/tcomment_vim'

" Format on save
Plugin 'chiel92/vim-autoformat'

" Autocompletion
Plugin 'valloric/youcompleteme'

" Guess indent width
Plugin 'tpope/vim-sleuth'

" Zen mode (F3)
Plugin 'junegunn/goyo.vim'

" Programming languages
Plugin 'ollykel/v-vim'
Plugin 'ziglang/zig.vim'
Plugin 'othree/html5.vim'
Plugin 'fatih/vim-go'
Plugin 'dag/vim-fish'

" Misc
Plugin 'tpope/vim-surround'
call vundle#end()

" tabwidth 4
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab linebreak

" relative line numbers
set nu rnu

" disable swap files
set noswapfile

" disable word wrapping
set nowrap

" disable mouse
set mouse=

" remove delay when pressing O
set timeout ttimeoutlen=100

" split on right and bottom
set splitright splitbelow

" allow selecting further than the end of lines
set virtualedit=block

" lazyredraw for large bulk edits
set lazyredraw

" highlight all search matches
set hls

" colors for diffs
hi DiffAdd ctermbg=black ctermfg=green cterm=reverse
hi DiffChange ctermbg=black ctermfg=magenta cterm=reverse
hi DiffDelete ctermbg=black ctermfg=darkred cterm=reverse
hi DiffText ctermbg=black ctermfg=red cterm=reverse

" switch buffers with a leading count, e.g. 3<C-Left>
map gd :bd<CR>
map <C-Left> :<C-u>execute v:count1 . "bp"<CR>
map <C-Right> :<C-u>execute v:count1 . "bn"<CR>

" switch between header and source
map <F4> :call CurtineIncSw()<CR>
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
nmap <C-S-Left> :vertical resize -10<CR>
nmap <C-S-Right> :vertical resize +10<CR>
nmap <C-S-Up> :resize -5<CR>
nmap <C-S-Down> :resize +5<CR>

" show line breaks
"set list

" clang-format on save
function! FormatOnSave()
  let l:formatdiff = 1
  Autoformat
endfunction
autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp call FormatOnSave()

" options for writing text
function! Text()
  set smartindent wrap linebreak breakindent showbreak=.
endfunction

map _t :call Text()<CR>

" Save window position when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" disable clangd in ycm
let g:ycm_use_clangd = 0

" ignore .o files in CtrlP
set wildignore+=*.o,moc_*,/.git/

" toggle virtualedit
map _v :let &ve=&ve=="all"?"block":"all"<CR>

" format/test xml
map _fx :% !xmllint --nowarning -<CR>
map _tx :%w !xmllint --noout -<CR>

" format json
map _fj :% !python -m json.tool -<CR>

" zen mod
map <F3> :Goyo<CR>
