" plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Git stuff (:G, :Gdiff, :Gpull)
Plugin 'tpope/vim-fugitive'

" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Powerline, buffers on top + info on bottom
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

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
"Plugin 'dense-analysis/ale'

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
Plugin 'elzr/vim-json'
Plugin 'elixir-editors/vim-elixir'
Plugin 'ElmCast/elm-vim'
Plugin 'tkztmk/vim-vala'

" Misc
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin indent on

" tabwidth 4
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

" highlight spaces at end of line
highlight ExtraWhitespace ctermbg=52 guibg=red
match ExtraWhitespace /\s\+$/

" colors for diffs
hi DiffAdd ctermbg=black ctermfg=green cterm=reverse
hi DiffChange ctermbg=black ctermfg=magenta cterm=reverse
hi DiffDelete ctermbg=black ctermfg=darkred cterm=reverse
hi DiffText ctermbg=black ctermfg=red cterm=reverse

" switch buffers with a leading count, e.g. 3<C-Left>
map gd :bd<CR>
map <C-Left> :<C-u>execute v:count1 . "bp"<CR>
map <C-Right> :<C-u>execute v:count1 . "bn"<CR>

" switch tabs with a leading count
map <A-Left> :<C-u>execute v:count1 . "tabp"<CR>
"map <A-Right> :<C-u>execute v:count1 . "tabnext"<CR>
map <A-Right> :tabnext<CR>
map <A-Up> :tabnew<CR>
map <A-Down> :tabclose<CR>

" switch between header and source
map <F4> :call CurtineIncSw()<CR>
map <C-K> :NERDTreeToggle<CR>

" airline tabs
let g:airline#extensions#tabline#enabled = 1

" airline theme
let g:airline_theme='angr'

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
autocmd BufWritePre *.hpp,*.h,*.c,*.cc,*.cpp call FormatOnSave()

" options for writing text
function! Text()
  set smartindent wrap linebreak breakindent showbreak=.
endfunction

map _t :call Text()<CR>

" Save window position when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview') && &diff == 0) | call winrestview(b:winview) | endif
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

" zen mode
map <F3> :Goyo<CR>
let g:colors_name = ""

" youcompleteme config
let g:ycm_min_num_of_chars_for_completion = 0

hi YcmErrorSection ctermbg=52
hi YcmErrorSign ctermbg=52
hi YcmWarningSection ctermbg=130
hi YcmWarningSign ctermbg=130

" jump to last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" line number color
hi LineNr ctermfg=240
hi EndOfBUffer ctermfg=237

