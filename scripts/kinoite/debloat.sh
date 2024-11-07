#!/bin/bash

set -ouex pipefail

remove_packages=(
    "toolbox"
    "firefox"
    "firefox-langpacks"
)

rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}
