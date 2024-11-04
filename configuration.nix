{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}:
{
  boot.loader.systemd-boot.enable = true;

  fileSystems."/".device = "/dev/vda1";

  home-manager.users.nixos = import ./home.nix;

  users.users.nixos = {
    isNormalUser = true;
    password = "nixos";
    extraGroups = [ "wheel" ];
  };

  services.getty.autologinUser = "nixos";
  security.sudo.wheelNeedsPassword = false;

  virtualisation.vmVariant = {
    virtualisation.cores = 4;
    virtualisation.memorySize = 4096;
    virtualisation.diskSize = 8192;
    virtualisation.diskImage = null;
    virtualisation.graphics = false;
  };

  system.stateVersion = "24.11";
}
