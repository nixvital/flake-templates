# This is based on viper's article https://ayats.org/blog/nix-rustup

{
  description = "Minimal starting project for nix-based maturin package development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, utils, devshell, rust-overlay, ... }@inputs:
    utils.lib.eachDefaultSystem (system: {
      devShells.default =
        let pkgs = import nixpkgs {
              inherit system;

              overlays = [
                devshell.overlays.default
                rust-overlay.overlays.default
              ];
            };

            toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;

            pythonEnv = pkgs.python3.withPackages (ps: with ps; [
              numpy
            ]);

        in pkgs.devshell.mkShell {
          name = "maturin-basics";

          commands = with pkgs; [
            { name = "maturin"; package = maturin; }
            { name = "python"; package = pythonEnv; }
          ];

          packages = [
            toolchain
            pkgs.rust-analyzer-unwrapped
          ];

          env = [
            {
              name = "RUST_SRC_PATH";
              value = "${toolchain}/lib/rustlib/src/rust/library";
            }
          ];
        };
    });
}
