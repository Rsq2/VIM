   set nocompatible              " be iMproved, required
   filetype off                  " required

   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()

   Plugin 'gmarik/Vundle.vim'
   Plugin 'Valloric/YouCompleteMe'
   Plugin 'The-NERD-Commenter'
   Plugin 'Yggdroot/indentLine'
   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent on    " required


"========THEME========"
colorscheme badwolf
let g:badwolf_css_props_highlight = 1
let g:badwolf_darkgutter = 1
let g:badwolf\_tabline = 2

syntax enable
set lazyredraw
set guifont=Monospace 9

"========TABS========="
set tabstop=4 "visual spaces in a <tab>"
set softtabstop=4 "number of spaces in a <tab> when editing"
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal softtabstop=2
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType html setlocal softtabstop=2

set expandtab "turns <tab> into spaces"

let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#998f84' "Lightest grey from Badwolf as line indents

"=====MULTIPLE FILES====="
" Movement between tabs OR buffers
nnoremap L :call MyNext()<CR>
nnoremap H :call MyPrev()<CR>

" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

"=======INLINE========"
set number "line number"
set cursorline "highlights current line"
set wildmenu "commandline autocomplete"
set showmatch "show matching bracket"

"====FILE HANDLING===="
filetype indent on
au FocusLost * :wa "Write all open files on tabout

"=======SEARCH========"
set incsearch "search as things are entered"
set hlsearch "highlight matches"
nnoremap <leader><space> :nohlsearch<CR>
"remap space to turn off search highlight"

"======FOLDING========"
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent "fold based on indent"

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

"=Current=Project=Stuff="
map <leader><TAB> ":tabnew ~/Pytracer/
