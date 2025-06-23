{ inputs, ... }:

{
  flake.overlays.dev = inputs.nixpkgs.lib.composeManyExtensions [
    # Add overlays here.
  ];


  perSystem = { system, pkgs-dev, lib, ... }: {
    _module.args.pkgs-dev = import inputs.nixpkgs {
      inherit system;
      overlays = [ inputs.self.overlays.dev ];
    };

    devShells.default = let
      name = "pnpm starter";
      typescript-icon = "e628";
    in pkgs-dev.mkShell {
      inherit name;

      packages = with pkgs-dev; [
        pnpm_10
        nodejs
      ];

      shellHook = ''
        export PS1="$(echo -e '\u${typescript-icon}') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (${name}) \\$ \[$(tput sgr0)\]"
      '';
    };
  };
}
