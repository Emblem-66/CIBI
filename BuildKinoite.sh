#!/bin/bash

set -ouex pipefail

SYS="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system"
KN="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/kinoite"
APP="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application"

# System scripts
curl -s "${SYS}/autoupdate.sh" | bash
curl -s "${SYS}/kernel.sh" | bash
curl -s "${SYS}/mesa-git.sh" | bash
curl -s "${SYS}/codecs.sh" | bash
curl -s "${SYS}/fonts.sh" | bash
curl -s "${SYS}/utilities.sh" | bash
curl -s "${SYS}/tailscale.sh" | bash
curl -s "${SYS}/distrobox.sh" | bash
curl -s "${SYS}/just.sh" | bash

# Silverblue scripts
curl -s "${KN}/debloat.sh" | bash
curl -s "${KN}/packages.sh" | bash

# Application scripts
curl -s "${APP}/steam.sh" | bash
curl -s "${APP}/bottles.sh" | bash

rpm -qa | sort
