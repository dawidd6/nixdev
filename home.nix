{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}:
{
  #services.podman = {
  #  enable = true;
  #  containersConf.settings = {
  #    network = {
  #      default_subnet="172.16.10.0/24";
  #      default_subnet_pools = [
  #        {base = "172.16.11.0/24"; size = 24;}
  #        {base = "172.16.12.0/24"; size = 24;}
  #      ];
  #    };
  #  };
  #  storage.settings = {
  #    storage = {
  #      runroot = "$HOME/.containers/runroot";
  #      graphroot = "$HOME/.containers/graphroot";
  #    };
  #  };
  #  registries = {
  #    block = ["ghcr.io"];
  #    insecure = ["quay.io"];
  #    search = ["docker.io"];
  #  };
  #  policy = {
  #    default = [ { type = "insecureAcceptAnything"; } ];
  #  };
  #};

  #programs.fish.enable = true;
  #programs.fish.interactiveShellInit = ''
  #  echo interactive
  #'';
}
