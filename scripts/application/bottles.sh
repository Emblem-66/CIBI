#!/bin/bash

set -ouex pipefail

#curl -o /etc/yum.repos.d/_copr_bottles.repo "https://copr.fedorainfracloud.org/coprs/gui1ty/bottles/repo/fedora-rawhide/gui1ty-bottles-fedora-rawhide.repo"

dnf copr enable -y gui1ty/bottles

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
#rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree 
dnf install -y ${rpmfusion[@]}

install_packages=(
"bottles"
"goverlay"
"mangohud"
"gamemode"
"vkBasalt"
)
#rpm-ostree install --idempotent --force-replacefiles ${install_packages[@]}

dnf install -y ${install_packages[@]}