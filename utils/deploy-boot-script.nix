{ pkgs, stdenv, ... }:
stdenv.mkDerivation {
  pname = "Deployer";
  version = "1.0";

  # TODO: Maybe make the deployment not rely on this hardcoded key location and name
  src = pkgs.writeScript "deploy-boot.sh" ''
    #!/bin/bash

    export SSH_KEY="~/.ssh/id_build_server"
    export NIX_SSHOPTS="-i $SSH_KEY"

    nixos-rebuild boot --flake ./#default --target-host root@frog-fractions.local
  '';

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/deploy-boot
  '';
}
