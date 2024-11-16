#!/bin/bash

set -ouex pipefail

install_packages=(
    "ibm-plex-fonts-all"
    "rsms-inter-fonts"
    "levien-inconsolata-fonts"
)

rpm-ostree install --idempotent ${install_packages[@]}
