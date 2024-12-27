#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl --retry 3 -Lo /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:alternateved:nightly-emacs.repo https://copr.fedorainfracloud.org/coprs/alternateved/nightly-emacs/repo/fedora-${RELEASE}/alternateved-nightly-emacs-fedora-${RELEASE}.repo

rpm-ostree install emacs

systemctl enable podman.socket
