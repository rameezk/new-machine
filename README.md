# new-machine

> A purely functional declaration of my machines using NixOS

## Quick start
1. Download [NixOS 20.09](https://channels.nixos.org/nixos-20.09/latest-nixos-plasma5-x86_64-linux.iso)
2. Boot into installer
3. If you're behind a proxy, run the steps [specified below](#corporate-proxy)
4. Run install script with `curl -s https://raw.githubusercontent.com/rameezk/new-machine/master/install.sh | bash`
<!-- 3. Clone this repo with `git clone https://github.com/rameezk/new-machine /mnt/etc/nixos` -->
<!-- 4. Setup partitions and mounts with `sudo ./mnt/etc/nixos/hosts/{machine-name}/partition-and-mount.sh`, replacing `{machine-name}` with a machine name seens in `hosts` -->

## Corporate Proxy
If you're behind a corporate proxy you will need to do the following.

1. Create a _proxy_ file with `vim ~/.proxyrc`
2. Add the following

``` sh
proxy="http://username:password@host:port"

export http_proxy=$proxy
export https_proxy=$proxy
```
3. Source the file with `source ~/.proxyrc`

## References
1. Based heavily off the work [here](https://github.com/hlissner/dotfiles). I chose to start from scratch, instead of just forking, because I wanted to learn NixOS (and flakes).

