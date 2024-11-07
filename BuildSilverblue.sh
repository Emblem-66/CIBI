#!/bin/bash

set -ouex pipefail

bash <(curl -s https://raw.githubusercontent.com/Emblem-66/CIBI/refs/heads/main/scripts/system/kernel.sh)

rpm -qa | sort
