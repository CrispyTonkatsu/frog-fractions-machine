{ ... }:
{
  # NOTE: Add the other member's keys here so they can also remote deploy
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZpwDM9bJ299cwFmS9AvGolTNcOHSaLcewTQ0zEbupF erina@nixos"
  ];
}
