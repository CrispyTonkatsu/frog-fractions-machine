{ config, pkgs, ... }:
{
  imports = [
    ./modules/system.nix
    ./modules/networking.nix
    ./modules/remote-deploy.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "frog-fractions";
  networking.networkmanager.enable = true;

  users.users.admin = {
    isNormalUser = true;
    description = "frog fractions";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    fastfetchMinimal
  ];

  system.stateVersion = "25.11";
}
