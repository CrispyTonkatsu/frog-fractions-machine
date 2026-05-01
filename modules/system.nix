{ ... }:
{
  # NOTE: The core system settings

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Vancouver";

  i18n.defaultLocale = "en_CA.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nixpkgs.config.allowUnfree = true;

  # The GPU driver install
  hardware.graphics.enable = true;
}
