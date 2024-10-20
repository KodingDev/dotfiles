{
  lib,
  pkgs,
  ...
}: {
  # Enable XServer
  services.xserver = {
    enable = true;

    # Configure keymap to en-AU
    xkb = {
      layout = "au";
      variant = "";
    };
  };

  # Enable KDE Plasma
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Packages
  programs._1password.enable = true;
  programs._1password-gui.enable = true;
}