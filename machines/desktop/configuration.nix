{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [ 
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager

    ../../modules/generic/base.nix
    
    ../../modules/nixos/base.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/hardware/nvidia.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users.stella = {
      imports = [
        ../../modules/home-manager/base.nix
        ../../modules/home-manager/zsh.nix
        ../../modules/home-manager/fonts.nix
        ../../modules/home-manager/1password.nix
      ];
    };
  };

  networking.hostName = "desktop";

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    nixd

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        # bbenoist.nix
        jnoortheen.nix-ide
      ];
    })
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];
}
