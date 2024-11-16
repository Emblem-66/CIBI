#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
    "just"
)
rpm-ostree install --idempotent ${install_packages[@]}

cat <<EOF | sudo tee /etc/Justfile > /dev/null

flatpak-setup
    curl -s https://raw.githubusercontent.com/Emblem-66/just-scripts/refs/heads/main/flatpak-setup.sh | bash

flatpak-apps
    curl -s https://raw.githubusercontent.com/Emblem-66/just-scripts/refs/heads/main/flatpak-APPS.sh | bash

flatpak-kde-apps
    curl -s https://raw.githubusercontent.com/Emblem-66/just-scripts/refs/heads/main/flatpak-GNOME.sh | bash

flatpak-gnome-apps
    curl -s https://raw.githubusercontent.com/Emblem-66/just-scripts/refs/heads/main/flatpak-KDE.sh | bash

EOF
