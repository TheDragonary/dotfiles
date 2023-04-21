# Dotfiles
My configuration for Arch Linux
- KDE
- zsh
- kitty
- Icons
- Cursors
- Fonts

## Using the install script
Using the script "install.sh" will automatically do all of the below for you. This script is mainly for my personal use since it installs all of the apps and packages that I use but feel free to edit it for yourself to select which things you want to install or not.
```
wget https://raw.githubusercontent.com/TheDragonary/dotfiles/master/install.sh
chmod +x install.sh
./install.sh
```
Or you can run all of the commands at once:
```
wget https://raw.githubusercontent.com/TheDragonary/dotfiles/master/install.sh && chmod +x install.sh && ./install.sh
```

## Install zsh
```
sudo pacman -S zsh 
```
Change the shell to zsh
```
chsh
/bin/zsh
```
### Install zsh4humans
```
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi
```
## Install yay
```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```
## Install fonts
```
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-liberation ttf-roboto ttf-ubuntu-font-family && yay -S ttf-meslo-nerd-font-powerlevel10k
```

## Setup repository
```
git clone --bare https://github.com/TheDragonary/dotfiles.git $HOME/.dotfiles && alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## Complete configuration setup
This pushes all of the dotfiles to the Home directory and overwrites any existing files
```
dotfiles checkout -f
```
