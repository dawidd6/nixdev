let
  nixpkgs = ../nixpkgs;
  home-manager = ../home-manager;
in
rec {
  inherit (nixosSystem.config.system.build) vm toplevel;
  nixosSystem = import /${nixpkgs}/nixos/lib/eval-config.nix {
    modules = [
      /${home-manager}/nixos
      ./configuration.nix
    ];
  };
}
