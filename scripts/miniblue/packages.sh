#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
"adw-gtk3-theme"
"gnome-shell-extension-caffeine"
"gnome-shell-extension-light-style"
"gnome-shell-extension-just-perfection"
"ffmpegthumbnailer"
)

install_applications=(
"ffmpegthumbnailer"
"gnome-tweaks"
"clapper"
"gnome-text-editor"
"loupe"
)
#rpm -q ${install_packages[@]} || rpm-ostree install ${install_packages[@]}
rpm-ostree install --idempotent --force-replacefiles ${install_packages[@]}
#rpm-ostree install --idempotent --force-replacefiles ${install_applications[@]}

git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com
git clone https://github.com/joaophi/tailscale-gnome-qs.git /tmp && mv /tmp/tailscale@joaophi.github.com /usr/share/gnome-shell/extensions/
