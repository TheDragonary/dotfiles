#!/bin/bash
echo "Installing yay"
sudo pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "Installing apps and packages"
sudo pacman -S --noconfirm firefox neofetch git broadcom-wl plymouth kio-gdrive unzip zip discord steam kitty zsh vi htop vim qbittorrent

echo "Installing fonts"
sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-liberation ttf-roboto ttf-ubuntu-font-family && yay -S --noconfirm ttf-meslo-nerd-font-powerlevel10k

echo "Installing Spotify"
yay -S --noconfirm spotify
bash <(curl -sSL https://raw.githubusercontent.com/SpotX-CLI/SpotX-Linux/main/install.sh) -ce

echo "Installing AUR packages"
yay -S --noconfirm cava cmatrix cbonsai neo-matrix-git ani-cli

echo "Changing shell to zsh"
sudo chsh -s /bin/zsh $USER
echo $SHELL

echo "Installing zsh4humans"
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

echo "Cloning dotfiles bare repo"
git clone --bare https://github.com/TheDragonary/dotfiles.git $HOME/.dotfiles && alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

echo "Pushing dotfiles"
dotfiles checkout -f
