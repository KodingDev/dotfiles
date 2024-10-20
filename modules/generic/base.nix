{
  lib,
  pkgs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    # Automatically remove old packages from the Nix store
    # to save space.
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = "nix-command flakes";

      # De-duplicates files in the Nix store
      auto-optimise-store = true;
    };
  };
  
  # Set your time zone.
  time.timeZone = "Australia/Sydney";
}