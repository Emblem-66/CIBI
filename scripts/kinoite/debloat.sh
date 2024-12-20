#!/bin/bash

set -ouex pipefail

remove_packages=(
"firefox"
"firefox-langpacks"
"kf5-kwallet"
"kf5-kwallet-libs"
"kf6-kwallet"
"kf6-kwallet-libs"
"kwalletmanager5"
"pam-kwallet"
"signon-kwallet-extension"
"kaccounts-integration-qt6"
"plasma-welcome"
"plasma-welcome-fedora"
)

#rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}
rpm-ostree uninstall --idempotent ${remove_packages[@]}
