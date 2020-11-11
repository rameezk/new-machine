#!/usr/bin/env bash
set -euo pipefail

function info {
    echo "[..] $1"
}

info "Cloning new-machine repo"
git clone https://github.com/rameezk/new-machine
