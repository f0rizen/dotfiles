![screenshot](https://github.com/f0rizen/dotfiles/raw/main/zsh/screenshot.png)

### Manual installation:
```
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Copy config
cp .zshrc $HOME
# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Theme
cp .p10k.zsh $HOME
```