let
  nixpkgs = ../nixpkgs;
  home-manager = ../home-manager;
  user = "nixos";
  module =
    {
      lib,
      config,
      osConfig,
      ...
    }:
    {
      imports = [
        /${home-manager}/nixos
        ./configuration.nix
      ];

      home-manager = {
        users.${user} = import ./home.nix;
        sharedModules = [ ({ home.stateVersion = lib.trivial.release; }) ];
        useUserPackages = true;
        useGlobalPkgs = true;
      };

      users.users.${user} = {
        isNormalUser = true;
        password = user;
        extraGroups = [ "wheel" ];
      };

      services.getty.autologinUser = user;
      security.sudo.wheelNeedsPassword = false;

      virtualisation.vmVariant = {
        virtualisation.cores = 4;
        virtualisation.memorySize = 4096;
        virtualisation.diskSize = 8192;
        virtualisation.diskImage = null;
        virtualisation.graphics = false;
      };

      system.stateVersion = lib.trivial.release;
    };
in
rec {
  default = nixosSystem.config.system.build.vm;
  nixosSystem = import /${nixpkgs}/nixos/lib/eval-config.nix {
    modules = [ module ];
  };
}
