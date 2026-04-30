{ pkgs, ... }:
{
  # This is the program that will manage the video services and start the desktop
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # This is KDE plasma
  services.desktopManager.plasma6.enable = true;

  # NOTE: You will have to enable the krdp on the settings yourself for the first time
  # Then you can just rely on the auto startup checkbox of KDE
  environment.systemPackages = with pkgs; [ kdePackages.krdp ];

  # We open the port because this is what krdp uses by default
  networking.firewall.allowedTCPPorts = [ 3389 ];
}
