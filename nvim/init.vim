call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'mhartington/oceanic-next'
Plug 'sainnhe/edge'
Plug 'rhysd/vim-clang-format'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'jdhao/better-escape.vim'
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
set ttyfast

set t_Co=256
"if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"     set termguicolors
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
set background=dark
let g:edge_style = 'aura'
let g:edge_better_performance = 1
colorscheme edge

nnoremap <silent> V :NERDTree<CR>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

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
