#!/bin/bash

set -ouex pipefail

remove_packages=(
"firefox"
"firefox-langpacks"
"fedora-chromium-config-gnome"
"fedora-chromium-config"
"gnome-classic-session"
"gnome-shell-extension-window-list"
"gnome-shell-extension-background-logo"
"gnome-shell-extension-launch-new-instance"
"gnome-shell-extension-apps-menu"
"gnome-shell-extension-places-menu"
"gnome-tour"
"yelp"
"yelp-libs"
"yelp-xsl"
)

#rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}
rpm-ostree uninstall --idempotent --force-replacefiles ${remove_packages[@]}
