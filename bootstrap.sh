#!/bin/bash

set -eu

if ! [ -x "$(command -v ansible-playbook)" ]; then
    sudo apt-get install --no-install-recommends ansible
fi

TMPDIR=$(mktemp -d)

pushd $TMPDIR >/dev/null
wget -qO- https://github.com/mbelivo/setup-becane/archive/master.tar.gz | tar xz
ansible-playbook setup-becane-master/main.yml -K
