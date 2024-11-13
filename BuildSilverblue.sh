#!/bin/bash

set -ouex pipefail

#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/autoupdate.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/kernel.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/mesa-git.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/codecs.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/fonts.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/utilities.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/just.sh | bash

#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/silverblue/debloat.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/silverblue/packages.sh | bash

#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application/steam.sh | bash
#curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application/bottles.sh | bash

BASE_URL="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts"

SYS="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system"
SB="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/silverblue"
APP="https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application"


# System scripts
curl -s "${SYS}/autoupdate.sh" | bash
curl -s "${SYS}/kernel.sh" | bash
curl -s "${SYS}/mesa-git.sh" | bash
curl -s "${SYS}/codecs.sh" | bash
curl -s "${SYS}/fonts.sh" | bash
curl -s "${SYS}/utilities.sh" | bash
curl -s "${SYS}/just.sh" | bash

# Silverblue scripts
curl -s "${BASE_URL}/silverblue/debloat.sh" | bash
curl -s "${BASE_URL}/silverblue/packages.sh" | bash

# Application scripts
curl -s "${BASE_URL}/application/steam.sh" | bash
curl -s "${BASE_URL}/application/bottles.sh" | bash

rpm -qa | sort
