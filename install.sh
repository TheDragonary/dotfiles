#!/bin/bash
echo "Installing yay"
sudo pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg --noconfirm -si

echo "Installing apps and packages..."
sudo pacman -S --noconfirm firefox neofetch git broadcom-wl plymouth kio-gdrive unzip zip discord steam kitty zsh vi htop vim qbittorrent flameshot xdg-desktop-portal ffmpeg ffmpegthumbs mpv

echo "Installing fonts..."
sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-liberation ttf-roboto ttf-ubuntu-font-family && yay -S --noconfirm ttf-meslo-nerd-font-powerlevel10k

echo "Installing AUR packages..."
yay -S --noconfirm cava cmatrix cbonsai neo-matrix-git ani-cli

echo "Installing GStreamer codecs..."
sudo pacman -S --noconfirm gstreamer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly && yay -S --noconfirm gst-plugin-libde265 gst-plugins-openh264

echo "Changing shell to zsh..."
sudo chsh -s /bin/zsh $USER
echo $SHELL

echo "Part 1 of the installation complete!"
echo "Run install2.sh after rebooting"
sleep 1
echo "Rebooting in 5..."
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
reboot
