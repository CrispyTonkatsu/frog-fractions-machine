{ ... }:
{
  services.xserver = {
    enable = true;

    # To start in tty for security
    autorun = false;
    displayManager.startx.enable = true;

    # The window manager we will be using as it is minimal
    windowManager.icewm.enable = true;
  };
}
