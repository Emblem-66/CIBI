#!/bin/bash

set -ouex pipefail

#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/autoupdate.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/kernel.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/mesa-git.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/codecs.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/fonts.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/utilities.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/tailscale.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/just.sh | bash

#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/kinoite/debloat.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/kinoite/packages.sh | bash

#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application/steam.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application/bottles.sh | bash

BASE_URL="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts"

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
#curl -s "${APP}/steam.sh" | bash
#curl -s "${APP}/bottles.sh" | bash

rpm -qa | sort

rpm -qa | sort
