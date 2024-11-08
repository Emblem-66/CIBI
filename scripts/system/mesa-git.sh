#!/bin/bash

set -ouex pipefail

#curl -o /etc/yum.repos.d/_copr_mesa-git.repo "https://copr.fedorainfracloud.org/coprs/xxmitsu/mesa-git/repo/fedora-rawhide/xxmitsu-mesa-git.repo"
# The flag ?arch=x86_64 is needed for 32bit packages for Steam
curl -o /etc/yum.repos.d/_copr_mesa-git.repo "https://copr.fedorainfracloud.org/coprs/xxmitsu/mesa-git/repo/fedora-rawhide/xxmitsu-mesa-git-fedora-rawhide.repo?arch=x86_64"

repo=(
    "copr:copr.fedorainfracloud.org:xxmitsu:mesa-git"
)

mesa_packages=(
"mesa-filesystem"
"mesa-libgbm"
"mesa-libglapi"
"mesa-dri-drivers"
"mesa-libEGL"
"mesa-libGL"
"mesa-vulkan-drivers"
"mesa-va-drivers"
)

rpm-ostree override replace --experimental --from repo=${repo[@]} ${mesa_packages[@]}

#rpm -q ${mesa_packages[@]} || rpm-ostree install ${mesa_packages[@]}
#rpm -q ${mesa_packages[@]} || rpm-ostree uninstall ${mesa_packages[@]}
#rpm -q ${mesa_packages[@]} || rpm-ostree override remove ${mesa_packages[@]} --install ${mesa_packages[@]}
