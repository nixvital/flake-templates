{
  description = "A starter project for a webapp managed by pnpm";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = { self, flake-parts, nixpkgs, ... }@inputs: flake-parts.lib.mkFlake {
    inherit inputs;
  } {
    systems = [ "x86_64-linux" ];

    imports = [ ./nix/development.nix ];
    
    perSystem = { system, config, pkgs-dev, ... }: {
      formatter = pkgs-dev.nixfmt-classic;
    };
  };
}
