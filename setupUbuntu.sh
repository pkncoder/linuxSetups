echo "Installing terminal emulator, app launcher, file explorer, and firefox"
sudo apt install konsole dolphin firefox

echo "Installing fastfetch git, and base-devel"
sudo apt install fastfetch git base-devel

echo "Installing flatpak"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing plasma and sddm"
sudo apt sddm plasma-desktop

echo "Adding sddm to systemctl"
systemctl enable sddm.service

mkdir -p /tmp/host_files
share /tmp/host_files 9p trans=virtio,rw,nofail 0 0

echo "Rebooting in 10 seconds"
sleep 10
reboot now

