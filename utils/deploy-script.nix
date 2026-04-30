{ pkgs, stdenv, ... }:
# This is a simple package, its a shorthand for deploying the image and make it the default and switch immediately
# DO NOT use this one if the deployment you are doing will change network settings (because it will deadlock as the ssh is stil active)

stdenv.mkDerivation {
  pname = "Deployer";
  version = "1.0";

  # TODO: Maybe make the deployment not rely on this hardcoded key location and name
  src = pkgs.writeScript "deploy.sh" ''
    #!/bin/bash

    export SSH_KEY="~/.ssh/id_build_server"
    export NIX_SSHOPTS="-i $SSH_KEY"

    nixos-rebuild switch --flake ./#default --target-host root@frog-fractions
  '';

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/deploy
  '';
}
