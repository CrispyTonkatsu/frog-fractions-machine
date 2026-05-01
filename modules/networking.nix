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

  # NOTE: This is what will make it have a name in the LAN
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  # NOTE: Probably some form of wired network via a small travel router would make this work both at digipen and also faster for the RDP
  # If that is done, there are no needed setting changes
}
