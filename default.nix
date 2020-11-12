{ config, lib, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    binaryCaches = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    registry = {
      nixos.flake = nixpkgs;
      nixpkgs.flake = nixpkgs-unstable;
    };
    useSandbox true;
  };
  system.configurationRevision= mkIf (self ? rev) self.rev;
  system.stateVersion = "20.09";

  fileSystems."/".device = "/dev/disk/by-label/nixos";

  boot.kernalPackage = pkgs.linuxPackages_5_9;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 10;
    systemd-boot.enable = mkDefault true;
  };

  environment.systemPackages = with pkgs; [
    cached-nix-shell
    coreutils
    git
    vim
    wget
    gnumake
  ];
}
