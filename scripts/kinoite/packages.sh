#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm-ostree install --idempotent --force-replacefiles ${rpmfusion[@]}

install_packages=(
"haruna"
"qview"
"gwenview"
"okular"
"kompare"
"marknote"
"krusader"
"ark"
)
#rpm -q ${install_packages[@]} || rpm-ostree install ${install_packages[@]}
rpm-ostree install --idempotent --force-replacefiles ${install_packages[@]}
