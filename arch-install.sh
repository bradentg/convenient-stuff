# Init
cd ~
sudo pacman -S git

# Paru
sudo pacman -S --needed base-devel
cd dev
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~

# Pokemon
echo "Installing pokemon colorscripts from gitlab..."
mkdir dev && cd dev
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
cd ~

# Compilation
sudo pacman -S cmake meson

# Nvidia drivers
sudo pacman -S nvidia-dkms nvidia-utils vulkan-headers

# Qt Wayland Support
sudo pacman -S qt5-wayland qt6-wayland

# Hyprland
sudo pacman -S hyprland xdg-desktop-portal-hyprland

# Shell
sudo pacman -S fish

# Audio control GUI
sudo pacman -S pavucontrol

# Desktop environment
sudo pacman -S waybar rofi-wayland swaync

# System monitoring
sudo pacman -S btop fastfetch

# GPU monitoring
sudo pacman -S nvtop

# Network management
sudo pacman -S networkmanager network-manager-applet

# Browsers
sudo pacman -S firefox
paru -S google-chrome
xdg-settings set default-web-browser firefox.desktop

# NordVPN
paru -S nordvpn-bin
sudo usermod -aG nordvpn $USER

# Needed to support mounted NTFS partition
sudo pacman -S ntfs-3g

# Media
sudo pacman -S mpv tumbler ffmpegthumbnailer qbittorrent
paru -S plex-media-server

# SteamVR
sudo pacman -S lib32-gtk2 lib32-libva lib32-libvdpau

# Gaming
sudo pacman -S prismlauncher mangohud lib32-mangohud

# Organization
sudo pacman -S obsidian

# Software Development
sudo pacman -S go git github-cli

# Wallpaper
sudo pacman -S hyprpaper swww
paru -S mpvpaper waypaper

# Discord client
paru -S webcord-git


