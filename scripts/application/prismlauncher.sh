#!/bin/bash

set -ouex pipefail

curl -o /etc/yum.repos.d/_copr_prismlauncher.repo "https://copr.fedorainfracloud.org/coprs/g3tchoo/prismlauncher/repo/fedora-rawhide/g3tchoo-prismlauncher-fedora-rawhide.repo"

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
"prismlauncher"
"goverlay"
"mangohud"
"gamemode"
"vkBasalt"
)
rpm-ostree install --idempotent --force-replacefiles ${install_packages[@]}

remove_packages=(
""
)
#rpm-ostree install --idempotent --force-replacefiles ${remove_packages[@]}
