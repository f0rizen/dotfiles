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
set shell=/bin/bash
set background=dark

colorscheme dracula
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1


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

noremap <f3> :call Compile()<CR>
noremap <f4> :call Run()<CR>
