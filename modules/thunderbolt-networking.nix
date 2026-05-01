{ ... }:
{
  services.hardware.bolt.enable = true;

  networking.useNetworkd = true;

  systemd.network = {
    enable = true;

    links."40-thunderbolt" = {
      linkConfig.Name = "tbt0";
      matchConfig.Driver = "thunderbolt-net";
    };

    networks."40-thunderbolt" = {
      matchConfig.Name = "tbt0";

      address = "10.0.0.1/24";

      networkConfig = {
        LLMNR = true;
        MultiCastDNS = true;
      };

      linkConfig.RequiredForOnline = "no";
    };
  };

  networking.firewall.trustedInterfaces = [ "tbt0" ];
}
