{ pkgs, ... }:
{
  # This tells nixos to evaluate the values in the expressions for these files (aka more config values)
  # Nix is a lazy evaluated language which means it will not follow an order
  # therefore conflicts can't happen in the config (check lib.mkDefault if you *really* need to)
  imports = [
    ./modules/system.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/remote-deploy.nix
  ];

  # Enabling flakes because it makes nix so much nicer to work with
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # The users in the system being decalred
  users.users.admin = {
    isNormalUser = true;
    description = "frog fractions";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    # Packages only to be seen by the user
    packages = with pkgs; [ ];
  };

  # Packages available system wide
  environment.systemPackages = with pkgs; [
    # Just a test package (you can remove and add it)
    fastfetchMinimal
  ];

  # This tells it what version we generated this file so it can make some warnings regarding deprecation
  # Do not change this manually (it is meant to just stay like this until the nixos config is regenerated)
  system.stateVersion = "25.11";
}
