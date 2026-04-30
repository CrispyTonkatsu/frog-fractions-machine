{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = true;

  # NOTE: You will have to enable the krdp on the settings yourself for the first time
  # Then you can just rely on the auto startup checkbox of KDE
  environment.systemPackages = with pkgs; [ kdePackages.krdp ];

  networking.firewall.allowedTCPPorts = [ 3389 ];
}
