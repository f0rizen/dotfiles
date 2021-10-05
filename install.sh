path=$(dirname $0)
read -rp "This may delete your configs. Do you want to continue? " -e input
if [[ $input != "n" && $input != "N" && $input != "No" && $input != "nO" && $input != "NO" ]]; then
    echo "Setting up aliases and functions..."
    cp $path/.aliases $HOME
    cp $path/.functions $HOME
    if [[ -x "$(command -v git)" ]]; then
        echo "Setting up gitconfig..."
        cp $path/.gitconfig $HOME
    fi
    if [[ -x "$(command -v bash)" ]]; then
        echo "Setting up bashrc..."
        cp $path/bash/.bashrc $HOME
    fi
    if [[ -x "$(command -v zsh)" && -x "$(command -v git)" ]]; then
        echo "Setting up zsh config..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &>/dev/null
        cp $path/zsh/.zshrc $HOME
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &>/dev/null
        cp $path/zsh/.p10k.zsh $HOME
    fi
    if [[ -x "$(command -v tcsh)" ]]; then
        echo "Setting up tcshrc..."
        cp $path/tcsh/.tcshrc $HOME
    fi
    if [[ -x "$(command -v tmux)" && -x "$(command -v git)" ]]; then
        echo "Installing tmux config..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &>/dev/null
        cp $path/tmux/.tmux.conf $HOME
    fi
    if [[ -x "$(command -v screen)" ]]; then
        echo "Setting up GNU Screen config"
        cp $path/screen/.screenrc $HOME
    fi
    if [[ -x "$(command -v nvim)" && -x "$(command -v bash)" && -x "$(command -v python3)" ]]; then
        echo "Installing nvim config..."
        mkdir -p $HOME/.config/nvim
        python3 -m ensurepip &>/dev/null
        python3 -m pip install neovim &>/dev/null
        cp $path/nvim/init.vim $HOME/.config/nvim
        nvim -c :PlugInstall -c :q -c :q
    fi
    if [[ -x "$(command -v htop)" ]]; then
        echo "Setting up htoprc..."
        mkdir -p $HOME/.config/htop
        cp $path/htop/htoprc $HOME/.config/htop
    fi
    if [[ ( -x "$(command -v vscode)" || -x "$(command -v code)" || -x "$(command -v code-insiders)" ) && -x "$(command -v bash)" ]]; then
        echo "Installing vscode config..."
        chmod +x $path/vscode/install-extensions.sh
        $path/vscode/install-extensions.sh
        if [[ -x "$(command -v code-insiders)" ]]; then
            mkdir -p $HOME/.config/Code\ -\ Insiders/User/snippets
            cp $path/vscode/cpp.json $HOME/.config/Code\ -\ Insiders/User/snippets
            cp $path/vscode/keybindings.json $HOME/.config/Code\ -\ Insiders/User
            cp $path/vscode/settings.json $HOME/.config/Code\ -\ Insiders/User
        else
            mkdir -p $HOME/.config/Code/User/snippets
            cp $path/vscode/cpp.json $HOME/.config/Code/User/snippets
            cp $path/vscode/keybindings.json $HOME/.config/Code/User
            cp $path/vscode/settings.json $HOME/.config/Code/User
        fi
    fi
else
    exit 1
fi
