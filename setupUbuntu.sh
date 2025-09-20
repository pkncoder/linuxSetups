echo "Installing terminal emulator, app launcher, file explorer, and firefox"
sudo apt install konsole dolphin firefox

echo "Installing fastfetch git"
sudo apt install fastfetch git

echo "Installing flatpak"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing plasma and sddm"
sudo apt install sddm plasma-desktop

echo "Adding sddm to systemctl"
sudo systemctl enable sddm.service

mkdir -p /tmp/host_files
# echo "share /tmp/host_files 9p trans=virtio,rw,nofail 0 0" >> /etc/fstab

echo "Rebooting in 10 seconds"
sleep 10
sudo reboot now

