#!/bin/bash

set -ouex pipefail

SYS="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system"
MB="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/miniblue"
APP="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application"

# System scripts
curl -s "${SYS}/autoupdate.sh" | bash
curl -s "${SYS}/fonts.sh" | bash
#curl -s "${SYS}/utilities.sh" | bash
curl -s "${SYS}/tailscale.sh" | bash
curl -s "${SYS}/distrobox.sh" | bash
curl -s "${SYS}/just.sh" | bash

# Miniblue scripts
curl -s "${MB}/packages.sh" | bash
curl -s "${MB}/debloat.sh" | bash

dnf install -y --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' --setopt='terra.gpgkey=https://repos.fyralabs.com/terra$releasever/key.asc' terra-release
dnf install -y anda
anda list

rpm -qa | sort
