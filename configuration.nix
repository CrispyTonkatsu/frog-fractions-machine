{ pkgs, ... }:
{
  imports = [
    ./modules/system.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/remote-deploy.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
    wayvnc
  ];

  system.stateVersion = "25.11";
}
