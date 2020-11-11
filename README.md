# new-machine

> A purely functional declaration of my machines using NixOS

## Quick start
1. Download [NixOS 20.09](https://channels.nixos.org/nixos-20.09/latest-nixos-plasma5-x86_64-linux.iso)
2. Boot into installer
3. Clone this repo with `git clone https://github.com/rameezk/new-machine /mnt/etc/nixos`
4. Setup partitions and mounts with `sudo ./mnt/etc/nixos/hosts/{machine-name}/partition-and-mount.sh`, replacing `{machine-name}` with a machine name seens in `hosts`
