{
  pkgs,
  config,
  lib,
  modulesPath,
  user,
  ...
}:
{
  virtualisation.incus.enable = true;
  networking.nftables.enable = true;
  users.users.${user}.extraGroups = ["incus"];
}
