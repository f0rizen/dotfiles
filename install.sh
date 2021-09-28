path=$(echo $0 | sed 's|\(.*\)/.*|\1|')
banner="$path/banner"
cat $banner
echo ""
read -rp "This may delete your configs. Do you want to continue? " -e input
if [[ $input != "n" && $input != "N" && $input != "No" && $input != "nO" && $input != "NO" ]]; then
    echo "Setting up aliases and functions..."
    cp $path/.aliases $HOME
    cp $path/.functions $HOME
    echo "Setting up gitconfig..."
    cp $path/.gitconfig $HOME
    echo "Setting up bashrc..."
    cp $path/bash/.bashrc $HOME
    echo "Setting up zsh config..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    cp $path/zsh/.zshrc $HOME
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    cp $path/zsh/.p10k.zsh $HOME
    echo "Setting up tcshrc..."
    cp $path/tcsh/.tcshrc $HOME
    echo "Installing tmux config..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    cp $path/tmux/.tmux.conf $HOME
    echo "Setting up GNU Screen config"
    cp $path/screen/.screenrc $HOME
    echo "Installing nvim config..."
    mkdir -p $HOME/.config/nvim
    python3 -m ensurepip
    python3 -m pip install neovim
    cp $path/nvim/init.vim $HOME/.config/nvim
    nvim -c :PlugInstall -c :q -c :q
    echo "Setting up htoprc..."
    mkdir -p $HOME/.config/htop
    cp $path/htop/htoprc $HOME/.config/htop
    echo "Installing vscode config..."
    chmod +x $path/vscode/install-extensions.sh
    $path/vscode/install-extensions.sh
    mkdir -p $HOME/.config/Code\ -\ Insiders/User/snippets
    cp $path/vscode/cpp.json $HOME/.config/Code\ -\ Insiders/User/snippets
    cp $path/vscode/settings.json $HOME/.config/Code\ -\ Insiders/User
else
    exit 1
fi
