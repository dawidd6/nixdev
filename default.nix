let
  nixpkgs = ../nixpkgs;
  home-manager = ../home-manager;
  user = "nixos";
  module =
    {
      lib,
      config,
      osConfig,
      pkgs,
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
        extraSpecialArgs = {
          inherit user;
        };
        useUserPackages = true;
        useGlobalPkgs = true;
      };

      users.users.${user} = {
        isNormalUser = true;
        password = user;
        extraGroups = [ "wheel" ];
      };

      environment.systemPackages = with pkgs; [
        xterm # for resize command
      ];
      environment.loginShellInit = ''
        # if terminal with stdout, fix terminal size
        if [ -t 1 ]; then eval "$(resize)"; fi
      '';

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
    specialArgs = {
      inherit user;
    };
  };
}
