{ pkgs, stdenv, ... }:
stdenv.mkDerivation {
  pname = "Deployer";
  version = "1.0";

  # TODO: Maybe make the deployment not rely on this hardcoded key location and name
  src = pkgs.writeScript "connect-display.sh" ''
    #!/bin/bash

    export SSH_KEY="~/.ssh/id_build_server"

    ssh -L 5900:localhost:5900 erina@frog-fractions.local -i $SSH_KEY

    ${pkgs.tigervnc}/bin/tigervnc localhost:5900
  '';

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/deploy-boot
  '';
}
