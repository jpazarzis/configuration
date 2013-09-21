set nocompatible
source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/zenburn.vim
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

ab __in __init__(self):
ab python #!/usr/bin/python

"&path=&path.'/usr/include/c++/4.6.1'

execute "set path=".&path.",/usr/include/c++/4.6.1"


let code_templates_dir='/home/john/development/alogatas/code-templates'
"set tags+=/usr/include

"set tags+=/usr/include/c++/4.6.1/
"set tags=./tags

"set tags=./tags,$HOME/.vim/tags/python27.ctags
set tags=./tags,$HOME/.vim/tags/python27.ctags

set laststatus=2



set nobackup
set noswapfile

map <f12> :!ctags -R .<cr>


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


filetype plugin on

"execute pathogen#infect()
call pathogen#infect()



"let g:pydiction_location = '/home/john/.vim/bundle/pydiction/complete-dict'

set nofoldenable
set laststatus=2
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
        if pumvisible()
            if a:action == 'j'
                return "\<C-N>"
            elseif a:action == 'k'
                return "\<C-P>"
            endif
         endif
     return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>



function! CreateMain()
    let mainfilename='main.cpp'
    if filereadable(mainfilename)
        echo "Sorry, file ".mainfilename." cannot be created because already exists..."
        return
    endif
    execute "silent edit ".mainfilename
    execute "silent read ".g:code_templates_dir."/main.cpp"
    write
endfunction


function! Wp()
    set spell
    set wrap
endfunction


function! CreateHeader(class_name)

    let header = a:class_name.'.h'
    let replace_class_name = 'silent %s/simple_class/'.a:class_name.'/g'

    let replace_capitals_class_name = 'silent %s/SIMPLE_CLASS/'.toupper(a:class_name).'/g'
    if filereadable(header)
        echo "Sorry, file ".header." cannot be created because already exists..."
        return
    endif
    new
    execute "silent edit ".header
    execute "silent read ".g:code_templates_dir."/simple_class.h"
    execute replace_class_name
    execute replace_capitals_class_name
    write

endfunction


function! CreateUnitTest(name)
    let filename = a:name.'.py'
    let replace_class_name = 'silent %s/CLASS/'.a:name.'/g'
    if filereadable(filename)
        echo "Sorry, file ".filename." cannot be created because already exists..."
        return
    endif
    new
    execute "silent edit ".filename
    execute "silent read ".g:code_templates_dir."/unit-test.py"
    execute replace_class_name
    write
endfunction


function! CreateClass(class_name)

    let header = a:class_name.'.h'
    let cpp = a:class_name.'.cpp'
    let replace_class_name = 'silent %s/simple_class/'.a:class_name.'/g'

    let replace_capitals_class_name = 'silent %s/SIMPLE_CLASS/'.toupper(a:class_name).'/g'
    if filereadable(header)
        echo "Sorry, file ".header." cannot be created because already exists..."
        return
    endif

    if filereadable(cpp)
        echo "Sorry, file ".cpp." cannot be created because already exists..."
        return
    endif  


    execute "silent edit ".cpp
    execute "silent read ".g:code_templates_dir."/simple_class.cpp"
    execute replace_class_name
    write

    vsplit
    execute "silent edit ".header
    execute "silent read ".g:code_templates_dir."/simple_class.h"
    execute replace_class_name

    execute replace_capitals_class_name
    write

endfunction   
