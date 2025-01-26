{
  description = "My awesome python project";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];

      imports = [ ./nix/development.nix ];

      perSystem = { system, config, pkgs-dev, ... }: {
        formatter = pkgs-dev.nixfmt-classic;
      };
    };
}
