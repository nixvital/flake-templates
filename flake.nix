{
  description = "A collection of flake templates as starting points for your awesome projects";

  outputs = { self, nixpkgs, ... }@inputs: {
    templates = {
      torch-basics = {
        path = ./templates/torch-basics;
        description = "Template for a basic machine learning project with PyTorch";
      };

      jax-equinox-basics = {
        path = ./templates/jax-equinox-basics;
        description = "Template for a basic machine learning project with Jax (equinox)";
      };

      langchain-basics = {
        path = ./templates/langchain-basics;
        description = "Template for a basic langchain project";
      };

      cpp-starter-kit = {
        path = ./templates/cpp-starter-kit;
        description = "A nix based c++ development project skeleton with CMake";
      };

      nixos-config = {
        path = ./templates/nixos-config;
        description = "Template for creating a repo that hosts your NixOS configurations";
      };

      js-webapp-basics = {
        path = ./templates/js-webapp-basics;
        description = ''
          Template for creating repo of webapp development with Javascript
          and Typescript
        '';
      };

      pybind11-starter-kit = {
        path = ./templates/pybind11-starter-kit;
        description = ''
          Template for creating initial skeleton for a pybind11 project
        '';
      };

      maturin-basics = {
        path = ./templates/maturin-basics;
        description = ''
          Minimal starting project for nix-based maturin package development
        '';
      };

      python-project = {
        path = ./templates/python-project;
        description = ''
          Minimal starting project for nix-based python project development
        '';
      };
    };
  };
}
