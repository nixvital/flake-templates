{ inputs, ... }:

let self = inputs.self;

in {
  flake.overlays.default = inputs.nixpkgs.lib.composeManyExtensions [
    self.overlays.dev
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (python-final: python-prev: {
          starterpp = python-final.callPackage ./default.nix {};
        })
      ];
    })
  ];

  perSystem = { system, config, pkgs, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = [ self.overlays.default ];
    };

    packages.default = pkgs.python3Packages.starterpp;
    checks.run-unit-tests = pkgs.python3Packages.starterpp;
  };
}
