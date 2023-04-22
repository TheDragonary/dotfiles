#!/bin/zsh
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi

echo "Continuing installation..."
echo "Installing zsh4humans..."
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

echo "Installing Spotify..."
yay -S --noconfirm spotify
echo "Patching Spotify..."
bash <(curl -sSL https://raw.githubusercontent.com/SpotX-CLI/SpotX-Linux/main/install.sh) -ce

echo "Cloning dotfiles bare repo..."
git clone --bare https://github.com/TheDragonary/dotfiles.git $HOME/.dotfiles && alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

echo "Pushing dotfiles..."
dotfiles checkout -f

echo "Setting wallpaper..."
plasma-apply-wallpaperimage ~/Pictures/r34skyline.jpg
