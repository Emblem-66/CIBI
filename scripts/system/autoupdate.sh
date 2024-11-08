#!/bin/bash

set -ouex pipefail

sudo sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
sudo sed -i 's/#LockLayering=false/LockLayering=true/' /etc/rpm-ostreed.conf

#cat <<EOF | sudo tee /etc/rpm-ostreed.conf > /dev/null
#[Daemon]
#AutomaticUpdatePolicy=stage
##IdleExitTimeout=60
#LockLayering=true
##Recommends=true
#EOF

systemctl enable rpm-ostreed-automatic.timer

cat <<EOF | sudo tee /etc/systemd/system/flatpak-update.service > /dev/null
[Unit]
Description=Update Flatpaks
[Service]
Type=oneshot
ExecStart=/usr/bin/flatpak update -y
[Install]
WantedBy=default.target
EOF
systemctl enable flatpak-update.service

cat <<EOF | sudo tee /etc/systemd/system/flatpak-update.timer > /dev/null
[Unit]
Description=Update Flatpaks
[Timer]
OnCalendar=*:0/4
Persistent=true
[Install]
WantedBy=timers.target
EOF
systemctl enable flatpak-update.timer

