#!/usr/bin/env bash

machine="$1"
http_proxy="$http_proxy"

function info {
    echo "[..] $1"
}

if [[ -z "$machine" ]]; then
    info "You did not specify a machine. Exiting"
    exit 1
fi

info "Partitioning $machine."

read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    curl -s "https://raw.githubusercontent.com/rameezk/new-machine/master/hosts/$machine/partition-and-mount.sh" > "$HOME/$machine-partition-and-mount.sh"
    chmod +x "$HOME/$machine-partition-and-mount.sh"
    "$HOME/$machine-partition-and-mount.sh"

    info "Cloning new-machine repo"
    if [[ -n "$http_proxy" ]] ; then
        info "Looks like you have a proxy set. Setting up git with basic auth for proxy."
        git config --global http.proxyAuthMethod 'basic'
    fi

    git clone https://github.com/rameezk/new-machine /mnt/etc/nixos
fi


