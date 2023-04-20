# Dotfiles
My configuration for Arch Linux
- KDE
- Fonts
- zsh
- kitty

## Install zsh
```
sudo pacman -S zsh 
```
### Install zsh4humans
```
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi
```
## Install fonts
```
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-liberation ttf-roboto ttf-ubuntu-font-family ttf-meslo-nerd-font-powerlevel10k 
```

## Setup repository
```
git clone --bare https://github.com/TheDragonary/dotfiles.git $HOME/.dotfiles && alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## Complete configuration setup
```
dotfiles checkout -f
```
