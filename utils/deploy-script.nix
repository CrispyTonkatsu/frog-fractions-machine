{ nixpkgs, ... }:
{
  stdEnv.mkDerivation = {
    pname = "Deployer";
    version = "1.0";
  };
}
