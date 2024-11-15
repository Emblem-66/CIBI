#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
"steam"
"goverlay"
"mangohud"
"gamemode"
"vkBasalt"
)
#rpm -q ${install_packages[@]} || rpm-ostree install  --force-replacefiles ${install_packages[@]}

rpm-ostree install --idempotent --force-replacefiles ${install_packages[@]}

sudo sed -i 's|Exec=/usr/bin/steam %U|Exec=gamemoderun /usr/bin/steam %U|' /etc/share/applications/steam.desktop
