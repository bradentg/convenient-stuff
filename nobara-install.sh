# NOTE:
# Run 'sudo dnf update -y' and then reboot
# before running script

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

# GameMode + dependencies
sudo dnf install meson systemd-devel pkg-config git dbus-devel
cd ~ && mkdir dev && cd dev
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode && git checkout 1.8.2 && ./bootstrap.sh
sudo usermod -aG gamemode $(whoami)
gamemoded -t && cd ~

# Other stuff
sudo dnf install neovim
sudo dnf install zsh

# Install flatpak software
flatpak install flathub md.obsidian.Obsidian

