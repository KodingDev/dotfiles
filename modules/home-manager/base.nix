{
  lib,
  pkgs,
  ...
}: {
  home = {
    username = "stella";
    homeDirectory = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux "/home/stella")
      (lib.mkIf pkgs.stdenv.isDarwin "/Users/stella")
    ];
    stateVersion = "24.05";
  };

  # Reload system configs nicer
  systemd.user.startServices = "sd-switch";
}