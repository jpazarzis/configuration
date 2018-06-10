set nocompatible
source $VIMRUNTIME/mswin.vim
source $HOME/configuration/zenburn.vim
set nocompatible

set t_kb=^H
fixdel

behave mswin
set number
vmap <TAB> >
vmap <S-TAB> <
map <F9> <ESC>:write<CR>
map <C-S-TAB> :tabprevious<CR>
map <C-TAB> :tabnext<CR>

set tabstop=4
set guioptions-=T
set list
set expandtab
au BufReadPost * retab
set nowrap

set nobackup
set noswapfile

"nnoremap j gj
"nnoremap k gk
"vnoremap j gj
"vnoremap k gk
"nnoremap <Down> gj
"nnoremap <Up> gk
"vnoremap <Down> gj
"vnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk
