{
  # This is a flake, it enables nix to setup a plethora of environments (see below for the 2 this flake outputs)

  description = "The flake to build and deploy the frog-fractions machine";

  # These are the things that our flake will use to evaluate itself, these can be any form of links.
  inputs = {
    # The official nixpkgs repository (you can change it to a specific version for version pinning)
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Repo with a few utilities
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }@inputs:

    # Generating a development shell for each system that is possible
    flake-utils.lib.eachDefaultSystem (
      local-system:
      let
        pkgs = nixpkgs.legacyPackages.${local-system};
      in
      {
        devShells.default = pkgs.mkShell {
          name = "frog-fractions builder";

          packages = with pkgs; [
            rsync

            (callPackage ./utils/deploy-script.nix { })
            (callPackage ./utils/deploy-boot-script.nix { })
          ];
        };

      }
    )

    # The declared configurations of NixOS that can be built from this flake
    // {

      # NOTE: This would be beneficial to cross compile that way
      # the deployment can be done from places like a MAC (I just couldn't figure it out yet)
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./configuration.nix
          ./modules/hardware-configuration.nix
        ];
      };
    };
}
