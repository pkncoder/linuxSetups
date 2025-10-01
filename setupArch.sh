echo "Installing terminal emulator, app launcher, file explorer, firefox, image viewer, and decompresser"
sudo pacman -Syu foot wofi nautilus firefox mirage ark

echo "Installing fastfetch git, and base-devel"
sudo pacman -S fastfetch base-devel stow

echo "Installing flatpak"
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing yay"
git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si
cd ../
sudo rm -rf ./yay

echo "Installing sddm and waybar"
sudo pacman -S sddm waybar

echo "Installing hyprland, hyprland utils."
sudo pacman -S hyprland hyprlock hyprpaper
sudo pacman -S otf-font-awesome ttf-cascadia-code-nerd

echo "Cloning dotfiles"
git clone "https://github.com/typecraft-dev/dotfiles"
cd dotfiles
mkdir -p ~/.config/hypr

echo "Stowing dotfiles"
stow hyprlock/
stow wofi/
stow hyprpaper/
stow waybar/
stow backgrounds/
stow hyprmocha/

echo "Adding sddm to systemctl"
sudo systemctl enable sddm.service

# mkdir /tmp/host_files
# echo "share /tmp/host_files 9p trans=virtio,rw,nofail 0 0" >> /etc/fstab

echo "Rebooting in 10 seconds"
sleep 10
sudo reboot now
