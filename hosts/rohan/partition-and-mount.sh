#!/usr/bin/env bash

function info {
    echo "[..] $1"
}

info "Listing partitions"
sudo fdisk -l

