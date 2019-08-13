set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" *************************************************
" *** Put your non-Plugin stuff after this line ***
" *************************************************

" --- File tree ---
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 12
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" --- display number && enable mouse ---
set number
set mouse=a
let g:NetrwIsOpen=1

" ---  Function to toggle Netrw ---
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
                            " to disk, will remember history/marks.

set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.

" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally

" --- backup and swap files ---
set nobackup
set nowritebackup
set noswapfile

" --- remove sounds effects ---
set noerrorbells

set laststatus=2
set cursorline

" --- Syntax on ---
syntax on

" --- Set color scheme ---

set t_Co=256  " 256 colors terminal

let g:molokai_original=0
colorscheme molokai

" --- Show "invisible" characters ---
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the filename in the window titlebar
set title

" --- binding toggle Netrw to <F2> ---
noremap <silent> <F2> :call ToggleNetrw()<CR>

" --- Need to replace set number && nonumber from two to one key(s) ---
noremap <silent> <F3> :set nonumber<CR>
noremap <silent> <F4> :set number<CR>

" Toggle show tabs and trailing spaces
nnoremap <silent> <F5> :set nolist!<CR>
