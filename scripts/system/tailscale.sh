#!/bin/bash

set -ouex pipefail

curl -o /etc/yum.repos.d/_tailscale.repo "https://pkgs.tailscale.com/stable/fedora/tailscale.repo"

install_packages=(
"tailscale"
)

remove_packages=(
""
)

#rpm-ostree uninstall ${remove_packages[@]}
rpm-ostree install --idempotent ${install_packages[@]}

systemctl enable tailscaled
