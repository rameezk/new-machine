#!/usr/bin/env bash
http_proxy="$http_proxy"

function info {
    echo "[..] $1"
}

info "Cloning new-machine repo"

if [[ -n "$http_proxy" ]] ; then
    info "Looks like you have a proxy set. Setting up git for basic auth for proxy."
    git config --global http.proxyAuthMethod 'basic'
fi

git clone https://github.com/rameezk/new-machine
