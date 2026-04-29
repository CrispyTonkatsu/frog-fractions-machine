{ pkgs, ... }:
{
  # TODO: Set up the vnc here so that people can connect to the display and see what the computer is doing

  systemd.services.x11vnc = {
    description = "vnc server for x11";

    after = [ "display-manager.service" ];
    requires = [ "display-manager.service" ];

    serviceConfig = {
      ExecStart = "${pkgs.x11vnc}/bin/x11vnc -display :0 -auth guess -forever -noxdamage -repeat -rfbport 5900 -shared -localhost";
      # TODO: Make an easy way to connect so you don't have to spam the 2 lines to connect always

      Restart = "on-failure";
    };
  };
}
