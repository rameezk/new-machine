#!/usr/bin/env bash

function info {
    echo "[..] $1"
}

info "Creating partition table"
sudo parted /dev/sda -- mklabel gpt

info "Creating partitions"
sudo parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
sudo parted /dev/sda -- mkpart primary 512MiB 1536MiB # 1024MiB swap, should be available_memory / 2
sudo parted /dev/sda -- mkpart primary 1536MiB 100%

info "Setting boot flag"
sudo parted /dev/sda -- set 1 boot on

info "Formatting partitions"
sudo mkfs.fat -F32 -n BOOT /dev/sda1
sudo mkswap -L swap /dev/sda2
sudo mkfs.ext4 -L nixos /dev/sda3

info "Mounting drives"
sudo mount /dev/sda3 /mnt
sudo mkdir -p /mnt/{home,boot,usr/{backup,media,share,vm}}
sudo mount /dev/sda1 /mnt/boot
