{ pkgs, stdenv, ... }:
stdenv.mkDerivation {
  pname = "Deployer";
  version = "1.0";

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
