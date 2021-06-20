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
syntax on
set mouse=a
set title
set shell=/bin/tcsh
set background=dark

call plug#begin()
Plug 'vimlab/split-term.vim'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme xcode_dark
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set splitright
set splitbelow

nnoremap t :VTerm<CR>
nnoremap T :Term 11<CR>
nnoremap V :Vexplore 25<CR>

function Compile()
    let res = '"/tmp/' . expand('%:t:r') . '.o"'
    if expand('%:e') ==? 'cpp'
        exec '!clang++ -Wall -Wextra -std=gnu++17 -O0 "%" -g -o ' . res
    elseif expand('%:e') ==? 'c'
        exec '!clang -Wall -Wextra -O0 "%" -g -o ' . res
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

nnoremap F :ClangFormat<CR>
nmap <F7> <Plug>(ale_go_to_definition)
