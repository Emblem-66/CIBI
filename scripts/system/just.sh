#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm-ostree install --idempotent --force-replacefiles ${rpmfusion[@]}

install_packages=(
    "just"
)
rpm-ostree install --idempotent ${install_packages[@]}

#cat <<EOF | sudo tee /etc/Justfile > /dev/null
#justfile
#EOF
