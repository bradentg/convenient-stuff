# NOTE:
# Run 'sudo dnf update -y' and then reboot
# before running script

# RPM Fusion Configuration
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf update @core

# Multimedia setup
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf group install Multimedia

# NVIDIA Drivers
sudo dnf install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code # or code-insiders

# LibreWolf
curl -fsSL https://rpm.librewolf.net/librewolf-repo.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
sudo dnf install librewolf

# OpenRazer (Driver) and RazerGenie (GUI)
sudo dnf install kernel-devel
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/hardware:/razer/Fedora_$(rpm -E %fedora)/hardware:razer.repo
sudo dnf install openrazer-meta
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/hardware:razer/Fedora_40/hardware:razer.repo
sudo dnf install razergenie

# GitHub CLI
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

# Steam
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager --enable fedora-cisco-openh264 -y
sudo dnf install steam -y

# GameMode + dependencies
sudo dnf install meson systemd-devel pkg-config git dbus-devel
cd ~ && mkdir dev && cd dev
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode && git checkout 1.8.2 && ./bootstrap.sh
sudo usermod -aG gamemode $(whoami)
gamemoded -t && cd ~

# Wine, Lutris, dependencies
sudo dnf groupinstall "C Development Tools and Libraries"
sudo dnf groupinstall "Development Tools"
sudo dnf install wine
sudo dnf install winetricks
sudo dnf install lutris

# Other stuff
sudo dnf install vim
sudo dnf install neovim
sudo dnf install discord
sudo dnf install zsh

# Install Flatpak and enable remote
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install flatpak software
flatpak install flathub com.spotify.Client
flatpak install flathub md.obsidian.Obsidian

