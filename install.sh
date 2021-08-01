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
    echo "Setting up zshrc..."
    cp $path/zsh/.zshrc $HOME
    echo "Setting up tcshrc..."
    cp $path/tcsh/.tcshrc $HOME
    echo "Installing tmux config..."
    cp $path/tmux/.tmux.conf $HOME
    echo "Installing nvim config..."
    mkdir -p $HOME/.config/nvim
    cp $path/nvim/init.vim $HOME/.config/nvim
    nvim -c ":PluginInstall"
    nvim -c ":PlugInstall"
    echo "Setting up htoprc..."
    mkdir -p $HOME/.config/htop
    cp $path/htop/htoprc $HOME/.config/htop
    echo "Installing vscode config..."
    chmod +x $path/vscode/install-extensions.sh
    $path/vscode/install-extensions.sh
    cp $path/vscode/settings.json $HOME/.config/Code\ -\ Insiders/User
else
    exit 1
fi
