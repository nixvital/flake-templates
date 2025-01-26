{ inputs, ... }:

let
  self = inputs.self;
  nixpkgs = inputs.nixpkgs;
in {
  flake.overlays.dev = nixpkgs.lib.composeManyExtensions [
    # NOTE: Put development overlays here.
  ];

  perSystem = { system, pkgs-dev, lib, ... }: {
    _module.args.pkgs-dev = import nixpkgs {
      inherit system;
      overlays = [ self.overlays.dev ];
    };

    devShells.default = pkgs-dev.mkShell {
      name = "my-python-project";

      packages = with pkgs-dev; [
        (python3.withPackages (p:
          with p; [
            numpy
          ]))
        pyright
        ruff
        pre-commit
      ];

      shellHook = ''
        export PS1="$(echo -e '\uf3e2') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (PersonaX) \\$ \[$(tput sgr0)\]"  
        export PYTHONPATH="$(pwd):$PYTHONPATH"
      '';
    };
  };
}
