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
    for i in formulahendry.code-runner ms-azuretools.vscode-docker ms-vscode.cpptools ms-vscode-remote.remote-ssh ms-vscode-remote.remote-ssh-edit ms-python.python ms-python.vscode-pylance ms-toolsai.jupyter platformio.platformio-ide smockle.xcode-default-theme matthewevers.compiler-explorer xaver.clang-format llvm-vs-code-extensions.vscode-clangd; do
        $prog --install-extension $i &>/dev/null
    done
fi
