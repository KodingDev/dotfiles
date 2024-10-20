{
  lib,
  pkgs,
  ...
}: {
  # Configure bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
      # Allow rollback for 10 generations
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
    # Auto-select after 5s
    timeout = 5;
  };

  # Enable ZSH
  programs.zsh.enable = true;

  # TODO: Re-add this when we use sops for passwords
  # users.mutableUsers = false;
  users.users.stella = {
    isNormalUser = true;
    description = "Stella";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBazkMBtfCegmS8IDl3BLDH6qTgif6MCYbOTIW//ShHB"
    ];
    shell = pkgs.zsh;
  };

  # Disable sudo password
  security.sudo.wheelNeedsPassword = false;

  # Change locale to en-AU
  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable network
  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  # Enable services
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # NEVER CHANGE THIS
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}