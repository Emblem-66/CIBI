#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
#rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
"wireguard-tools"
)

remove_packages=(
""
)

#rpm-ostree uninstall --idempotent ${remove_packages[@]}
rpm-ostree install --idempotent ${install_packages[@]}
