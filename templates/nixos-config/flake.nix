{
  description = "NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    hardware.url = "github:NixOS/nixos-hardware/master";

    vital-modules.url = "github:nixvital/vital-modules";
    vital-modules.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, hardware, ... }@inputs: {
    nixosConfigurations = {

      # As an example here is a nixos configuration for a framework laptop.
      my-framework-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Get the community maintained framework baseline
          nixos-hardware.nixosModules.framework-12th-gen-intel
          vital-modules.nixosModules.foundation
          vital-modules.nixosModules.laptop
          vital-modules.nixosModules.iphone-connect
          ./machines/my-framework-laptop
        ];
      };

      # You can define more machines here.
    };
  };
}
