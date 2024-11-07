#!/bin/bash

set -ouex pipefail

bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/autoupdate.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/kernel.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/mesa-git.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/codecs.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/fonts.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/just.sh)

bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/kinoite/debloat.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/kinoite/packages.sh)

bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application/steam.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/application/bottles.sh)
