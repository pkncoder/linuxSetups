# echo "Installing sudo and configuring sudoers"
# pacman -Syu sudo

# export EDITOR="nvim"
# sudo visudo

echo "Installing terminal emulator, app launcher, file explorer, and firefox"
sudo pacman -Syu foot dolphin firefox

echo "Installing fastfetch git, and base-devel"
sudo pacman -S fastfetch git base-devel

echo "Installing flatpak"
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing yay, must be in user"
git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si

echo "Installing plasma and sddm"
pacman -S sddm plasma-desktop plasma-meta

echo "Adding sddm to systemctl"
systemctl enable sddm.service

mkdir /tmp/host_files
share /tmp/host_files 9p trans=virtio,rw,nofail 0 0

echo "Rebooting in 10 seconds"
sleep 10
reboot now

