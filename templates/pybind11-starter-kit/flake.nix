{
  description = "Starter skeleton for a pybind11 project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = { self, flake-parts, ... }@inputs: 
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];
      imports = [ ./nix/development.nix ./nix/release.nix ];

      perSystem = { system, config, pkgs-dev, ... }: {
        formatter = pkgs-dev.treefmt;
      };
    };
}
