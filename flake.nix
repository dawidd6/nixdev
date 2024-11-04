{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
      };
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      legacyPackages.${system} = pkgs;
    };
}
