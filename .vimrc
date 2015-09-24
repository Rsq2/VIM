set nocompatible              " be iMproved, requiredfiletype off                  " required
filetype off                  " required
execute pathogen#infect()
filetype plugin indent on    " required
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-o> :NERDTreeToggle<CR>

"========FIXES========"
let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""} "compatibility fix between YCM and vim-autoclose


"========THEME========"
set background=dark
colorscheme distinguished
syntax enable
set lazyredraw

set number "line number"
set showmatch "show matching bracket"
set cursorline "highlights current line"

set wildmenu "commandline autocomplete"
set completeopt-=preview "kill scratchmenu
"=======AIRLINE======="
let g:airline#extensions#tabline#enabled = 1   "extremely resource heavy
let g:airline_theme='badwolf'
set laststatus=2
let g:airline_powerline_fonts = 1

"========TABS========="
set tabstop=4 "visual spaces in a <tab>"
set softtabstop=4 "number of spaces in a <tab> when editing"
set shiftwidth=4
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal softtabstop=2
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType html setlocal softtabstop=2

set expandtab "turns <tab> into spaces"

let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#050505'
let g:indentLine_char = '┊'

"====FILE HANDLING===="
filetype indent on
au FocusLost * silent! wa
set autowriteall

" Movement between tabs OR buffers
nnoremap L :call MyNext()<CR>
nnoremap H :call MyPrev()<CR>

function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        normal gt
    else
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        normal gT
    else
        execute ":bprev"
    endif
endfunction

"=======SEARCH========"
set incsearch "search as things are entered
set hlsearch "highlight matches
nnoremap <leader><space> :nohlsearch<CR>

"======FOLDING========"
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent "fold based on indent

"==FILTHY WHITESPACES=="
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() "for more useful diffs

"======COPYPASTA======="
set clipboard unnamed "use system clipboard
map <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"====General Remaps====
inoremap jj <ESC>
