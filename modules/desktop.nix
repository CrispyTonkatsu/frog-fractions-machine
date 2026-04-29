{ pkgs, ... }:
{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time";
        user = "greeter";
      };
    };
  };

  services.xserver = {
    enable = true;

    displayManager.startx.enable = true;

    desktopManager.xfce = {
      enable = true;
    };
  };
}
