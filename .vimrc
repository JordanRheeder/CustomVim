" Syntax on
syntax on
" Set color scheme
colorscheme vividchalk
" Show "invisible" characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Enable mouse in all modes
set mouse=a
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the filename in the window titlebar
set title
" File tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
" Displays numbers
set number

