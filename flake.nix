{
  description = "The flake to build and deploy the frog-fractions machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {

          # TODO: Package to send the image so that it is easier
          packages = with pkgs; [
            rsync
            ./utils/deploy-script.nix
          ];
        };
      }
    )
    // {

      # NOTE: There is no cross compilation enabled for this
      # (normally should be compiled on x86_64 but if needed it's doable)
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          system = "x86_64-linux";
        };

        modules = [
          ./configuration.nix
        ];
      };
    };
}
