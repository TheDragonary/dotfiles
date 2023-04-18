# Dotfiles
My configuration for Arch Linux
- GNOME
- GNOME extensions
- GTK4 Theme
- Icons
- Cursors
- zsh
- Tilix

## Install zsh
```
sudo pacman -S zsh 
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Setup repository
```
git clone --bare https://github.com/TheDragonary/dotfiles.git $HOME/.dotfiles && alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## Complete configuration setup
```
dotfiles checkout -f
```
