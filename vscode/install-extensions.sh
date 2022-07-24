if [[ ! -x "$(command -v vscode)" && ! -x "$(command -v code)" && ! -x "$(command -v code-insiders)" ]]; then
    echo "Vscode not found"
else
    prog=""
    if [[ -x "$(command -v vscode)" ]]; then
        prog="vscode"
    elif [[ -v "$(command -v code)" ]]; then
        prog="code"
    else [[ -v "$(command -v code-insiders)" ]]
        prog="code-insiders"
    fi
    for i in ms-vscode.cpptools xaver.clang-format llvm-vs-code-extensions.vscode-clangd ms-azuretools.vscode-docker zhuangtongfa.material-theme platformio.platformio-ide rust-lang.rust-analyzer YishaiYosifov.templates; do
        $prog --install-extension $i &>/dev/null
    done
fi
