call plug#begin()
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xavierd/clang_complete'
Plug 'rhysd/vim-clang-format'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
call plug#end()

set clipboard+=unnamedplus
inoremap jj <Esc>
cnoremap jj <Esc>
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set number
set showcmd
set wildmenu
set encoding=UTF-8
syntax on
set mouse=a
set title
set shell=/bin/bash

set t_Co=256
set background=dark
colorscheme dracula

let g:clang_library_path='/usr/lib/llvm/12/lib64/libclang.so'
let g:clang_c_options = '-std=gnu17'
let g:clang_cpp_options = '-std=gnu++17'
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set splitright
set splitbelow

nnoremap <silent> V :NERDTree<CR>

function Compile()
    let res = '"/tmp/' . expand('%:t:r') . '.o"'
    if expand('%:e') ==? 'cpp'
        exec '!clang++ -Wall -Wextra -DLOCAL -std=gnu++17 -O3 "%" -g -o ' . res
    elseif expand('%:e') ==? 'c'
        exec '!clang -Wall -Wextra -DLOCAL -O3 "%" -g -o ' . res
    endif
endfunction

function Run()
    let name = '/tmp/' . expand('%:t:r') . '.o'
    if filereadable(name)
        exec '!' . '"' . name . '"'
    elseif expand('%:e') ==? 'py'
        !python3 %
    endif
endfunction

noremap <F3> :call Compile()<CR>
noremap <F4> :call Run()<CR>

let g:ale_linters = {
    \    'cpp': ['g++'],
    \}

let g:ale_completion_enabled = 1

let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
    \ "IndentWidth" : 4,
    \ "AllowShortFunctionsOnASingleLine" : "All",
    \ "AllowShortIfStatementsOnASingleLine" : "WithoutElse",
    \ "Standard" : "Auto"}

nnoremap <F7> :ClangFormat<CR>
nmap <F8> <Plug>(ale_go_to_definition)
