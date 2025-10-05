echo "Installing terminal emulator, app launcher, file explorer, firefox, decompresser, and window manager"
sudo pacman -Syu foot wofi nautilus firefox ark nwg-displays

echo "Installing fastfetch git, and base-devel"
sudo pacman -S fastfetch base-devel

echo "Installing flatpak"
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing yay"
git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si
cd ../
sudo rm -rf ./yay

echo "Installing sddm, starship, and waybar"
sudo pacman -S sddm waybar starship

echo "Installing image viewer."
yay -S mirage

echo "Installing hyprland, hyprland utils."
sudo pacman -S hyprland hyprlock hyprpaper hypridle
sudo pacman -S otf-font-awesome ttf-cascadia-code-nerd

echo "Cloning and adding dotfiles"
git clone "https://github.com/pkncoder/dotfiles.git"
mkdir -p ./.config/
mv dotfiles/* .config/
echo 'eval "$(starship init bash)"' >./.bashrc

echo "Installing lazyvim heath requirements."
sudo pacman -S lua51 luarocks lazygit wget tectonic python-pip python-neovim npm
sudo npm install -g neovim

echo "Adding sddm to systemctl"
sudo systemctl enable sddm.service

# mkdir /tmp/host_files
# echo "share /tmp/host_files 9p trans=virtio,rw,nofail 0 0" >> /etc/fstab

echo "Rebooting in 10 seconds"
sleep 10
sudo reboot now
