{ ... }:
{
  # NOTE: Add the other member's keys here so they can also remote deploy
  # The keys being used are ssh keys, you just need to generate (look online for the command)
  # the following key: ~/.ssh/id_build_server

  # Then read the id_build_server.pub key and paste it here on the list below

  # Then when calling ssh into the device, you can call:
  # ssh root@frog-fractions.local -i ~/.ssh/id_build_server

  # The reason I ask for this location is the command to deploy nix configs
  # will look for that key specifically (probably shouldn't so feel free to update it)

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZpwDM9bJ299cwFmS9AvGolTNcOHSaLcewTQ0zEbupF erina@nixos"
  ];
}
