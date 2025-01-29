# NOTE:
# Run 'sudo dnf update -y' and then reboot
# before running script

# RPM Fusion Configuration
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf update @core

# Tray Icons
sudo dnf install libappindicator-gtk3 gnome-shell-extension-appindicator gnome-extensions-app

# Multimedia setup
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf group install Multimedia

# Power (TLP)
sudo dnf remove tuned tuned-ppd
sudo dnf install tlp tlp-rdw
systemctl enable tlp.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code # or code-insiders

# LibreWolf
curl -fsSL https://rpm.librewolf.net/librewolf-repo.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
sudo dnf install librewolf

# GitHub CLI
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

# Other stuff
sudo dnf install neovim
sudo dnf install discord
sudo dnf install zsh

# Install Flatpak and enable remote
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install flatpak software
flatpak install flathub com.spotify.Client
flatpak install flathub md.obsidian.Obsidian
