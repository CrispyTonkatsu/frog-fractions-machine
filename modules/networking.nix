{ ... }:
{
  networking.hostName = "frog-fractions";
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
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

  # Thunderbolt network
  # TODO: Get this working so that it can be used at digipen

  # networking = {
  #   interfaces.thunderbolt0.ipv4.addresses = [
  #     {
  #       address = "10.0.0.1";
  #       prefixLength = 24;
  #     }
  #   ];
  # };
  #
  # systemd.network.networks."40-thunderbolt" = {
  #   matchConfig.Name = "thunderbolt0";
  #   linkConfig.RequiredForOnline = "no";
  # };
}
