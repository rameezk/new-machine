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

read -r -p "Is this a good question (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo Yes
    ;;
    * )
        echo No
    ;;
esac


# info "Partitioning $machine."
# read -r -p "Are you sure? [y/N] " response
# if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
#     curl -s "https://raw.githubusercontent.com/rameezk/new-machine/master/hosts/$machine/partition-and-mount.sh" | sh
# else
#     log "Ok. Bye."
#     exit 1
# fi


# info "Cloning new-machine repo"

# if [[ -n "$http_proxy" ]] ; then
#     info "Looks like you have a proxy set. Setting up git for basic auth for proxy."
#     git config --global http.proxyAuthMethod 'basic'
# fi

# git clone https://github.com/rameezk/new-machine
