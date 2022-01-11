call plug#begin()
Plug 'arzg/vim-colors-xcode'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'itchyny/lightline.vim'
Plug 'rhysd/vim-clang-format'
Plug 'ryanoasis/vim-devicons'
Plug 'ycm-core/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
call plug#end()

set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set number
set ruler
set wrap
set encoding=UTF-8
syntax on
set mouse=a
set shell=/bin/bash
filetype plugin on
set ttyfast
let g:UltiSnipsExpandTrigger="<c-a>"

set runtimepath+=~/.config/nvim/syntax
set t_Co=256
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
colorscheme xcodedark
set cursorline

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

let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
    \ "IndentWidth" : 4,
    \ "AllowShortFunctionsOnASingleLine" : "All",
    \ "AllowShortIfStatementsOnASingleLine" : "WithoutElse",
    \ "Standard" : "Auto"}

nnoremap <F7> :ClangFormat<CR>
