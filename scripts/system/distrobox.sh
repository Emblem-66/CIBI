#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
#rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
"distrobox"
)

remove_packages=(
"toolbox"
)

rpm-ostree uninstall --idempotent ${remove_packages[@]}
rpm-ostree install --idempotent ${install_packages[@]}

cat <<EOF | sudo tee /etc/systemd/system/distrobox-upgrade.service > /dev/null
[Unit]
Description=distrobox-upgrade Automatic Update

[Service]
Type=simple
ExecStart=distrobox-upgrade --all
StandardOutput=null
EOF

cat <<EOF | sudo tee /etc/systemd/system/distrobox-upgrade.timer > /dev/null
[Unit]
Description=distrobox-upgrade Automatic Update Trigger

[Timer]
OnBootSec=1h
OnUnitInactiveSec=1d

[Install]
WantedBy=timers.target
EOF

systemctl enable distrobox-upgrade.timer
