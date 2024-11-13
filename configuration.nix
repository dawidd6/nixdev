{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}:
{
  virtualisation.incus.enable = true;
  networking.nftables.enable = true;
}
