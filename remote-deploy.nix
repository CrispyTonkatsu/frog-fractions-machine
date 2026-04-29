{ ... }:
{
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZpwDM9bJ299cwFmS9AvGolTNcOHSaLcewTQ0zEbupF erina@nixos"
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
  };

  boot.kernelModules = [ "thunderbolt-net" ];

  networking = {
    interfaces.thunderbolt0.ipv4.addresses = [
      {
        address = "10.0.0.1";
        prefixLength = 24;
      }
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  # TODO: Get this working
  systemd.network.networks."40-thunderbolt" = {
    matchConfig.Name = "thunderbolt0";
    linkConfig.RequiredForOnline = "no";
  };
}
