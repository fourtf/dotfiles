call plug#begin('~/.vim/plugged')
" Git stuff (:G, :Gdiff, :Gpull)
Plug 'tpope/vim-fugitive'

" Plug manager
Plug 'VundleVim/Vundle.vim'

" Powerline, buffers on top + info on bottom
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Fuzzy search for files (Ctrl+P)
"Plug 'ctrlpvim/ctrlp.vim'

" Switch between source/header files in C++ (F4)
Plug 'ericcurtin/CurtineIncSw.vim'

" Open project tree (Ctrl+K)
Plug 'scrooloose/nerdtree'

" Comment lines (gcc or Ctrl+//)
Plug 'tomtom/tcomment_vim'

" Format on save
Plug 'chiel92/vim-autoformat'

" Replace in all files
Plug 'skwp/greplace.vim'

" Autocompletion
Plug 'valloric/youcompleteme'

" Guess indent width
Plug 'tpope/vim-sleuth'

" Zen mode (F3)
Plug 'junegunn/goyo.vim'

" Programming languages
Plug 'ollykel/v-vim'
Plug 'ziglang/zig.vim'
Plug 'othree/html5.vim'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
Plug 'elixir-editors/vim-elixir'
Plug 'ElmCast/elm-vim'
Plug 'tkztmk/vim-vala'
Plug 'nvie/vim-flake8' " Python
Plug 'pprovost/vim-ps1'
Plug 'vim-scripts/matchit.zip' " html switch tags with %
Plug 'alvan/vim-closetag' " html close tags
Plug 'udalov/kotlin-vim'

" Frameworks
Plug 'posva/vim-vue'
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/tsuquyomi-vue'

" Misc
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'fourtf/fzf.vim'
call plug#end()
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
map <A-Right> :<C-u>execute "tabnext" . (tabpagenr() + v:count1) <CR>
"map <A-Right> :tabnext<CR>
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

" clang-format on save
function! FormatOnSave()
  let l:formatdiff = 1
  Autoformat
endfunction
"autocmd BufWritePre *.hpp,*.h,*.c,*.cc,*.cpp call FormatOnSave()

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
map _fx :% !xmllint --nowarning --format -<CR>
map _tx :%w !xmllint --noout -<CR>

" format json
map _fj :% !python -m json.tool -<CR>

" fix js using eslint
map _fe : !eslint --fix %<CR>
map <silent> _fE mF:%!eslint_d --stdin --fix-to-stdout<CR>`F

" format using clang-format
function! ClangFormatHK()
  let l:save_pos = getpos(".")
  execute "% !clang-format '--assume-filename=%'"
  call setpos(".", l:save_pos)
endfunction
map _fc :call ClangFormatHK()<CR>

" zen mode
map <F3> :Goyo<CR>
let g:colors_name = ""

" youcompleteme config
"let g:ycm_min_num_of_chars_for_completion = 1

hi YcmErrorSection ctermbg=52
hi YcmErrorSign ctermbg=52
hi YcmWarningSection ctermbg=130
hi YcmWarningSign ctermbg=130

" jump to last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"zz" | endif
endif

" line number color
hi LineNr ctermfg=240
hi EndOfBUffer ctermfg=237

" disabled ex mode
map Q <NOP>

" Ctrl+P file search
function AutoFiles ()
  silent execute "!git rev-parse --git-dir"
  if v:shell_error == 0
    GFilesWithUntracked
  else
    Files
  endif
endfunction

map <C-P> :call AutoFiles()<CR>

set backspace=indent,eol,start

" Closing tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
"let g:ale_fix_on_save = 1
"let g:ale_fixers = {'javascript': ['eslint_d'], 'typescript': ['eslint_d']}
"let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
"let g:ale_linters = {'vue': ['eslint', 'vls']}
"let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_eslint_executable = 'eslint_d'
"let g:
let g:ale_linter_aliases = {'vue': ['javascript']}
"let g:vue_pre_processors = 'detect_on_enter'

set autoread

set background=light
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" let g:loaded_fzf = 1

autocmd BufNewFile,BufRead *.vue set filetype=vue
