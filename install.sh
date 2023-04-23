#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi

echo "Installing yay..."
sudo pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg --noconfirm -si

echo "Installing apps and packages..."
sudo pacman -S --noconfirm --needed firefox neofetch git broadcom-wl plymouth kio-gdrive unzip zip discord steam kitty zsh vi htop vim qbittorrent flameshot xdg-desktop-portal ffmpeg ffmpegthumbs mpv gwenview

echo "Installing fonts..."
sudo pacman -S --noconfirm --needed noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-liberation ttf-roboto ttf-ubuntu-font-family && yay -S --noconfirm ttf-meslo-nerd-font-powerlevel10k

echo "Installing AUR packages..."
yay -S --noconfirm cava cmatrix cbonsai neo-matrix-git ani-cli kvantum-gt5-git kvantum-gt6-git

echo "Installing GStreamer codecs..."
sudo pacman -S --noconfirm --needed gstreamer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly && yay -S --noconfirm gst-plugin-libde265 gst-plugins-openh264

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

echo "Installing Latte Dock"
git clone https://github.com/KDE/latte-dock.git && cd latte-dock
sudo pacman -S --noconfirm --needed cmake extra-cmake-modules python plasma-framework plasma-desktop plasma-wayland-protocols

echo "Changing shell to zsh..."
sudo chsh -s /bin/zsh $USER
echo $SHELL

echo "Installation complete!"
echo "Run install2.sh after rebooting to complete zsh setup"
sleep 1
echo "Your system will now reboot in..."
sleep 1
for i in {1..5}
do
  echo $((6-i))
  sleep 1
done
reboot
