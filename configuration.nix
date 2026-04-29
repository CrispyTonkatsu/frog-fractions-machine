{ pkgs, ... }:
{
  imports = [
    # NOTE: The system modules
    ./modules/system.nix
    ./modules/networking.nix
    ./modules/desktop.nix

    # NOTE: The team usage modules
    ./modules/remote-deploy.nix
    ./modules/remote-desktop.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Message to let people know they need to start the display themselves
  users.motd = ''
    Frog Fractions peak
    To start the desktop run startx
  '';

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
