#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl --retry 3 -L \
     -o /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:alternateved:nightly-emacs.repo \
     https://copr.fedorainfracloud.org/coprs/alternateved/nightly-emacs/repo/fedora-${RELEASE}/alternateved-nightly-emacs-fedora-${RELEASE}.repo

curl --retry 3 -L \
     -o /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:wezfurlong:wezterm-nightly.repo \
     https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-${RELEASE}/wezfurlong-wezterm-nightly-fedora-${RELEASE}.repo

rpm-ostree install \
    emacs cmake libtool \
    wezterm

systemctl enable podman.socket
