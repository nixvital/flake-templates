{
  description = "A collection of flake templates as starting points for your awesome projects";

  outputs = { self, nixpkgs, ... }@inputs: {
    templates = {
      torch-basics = {
        path = ./templates/torch-basics;
        description = "Template for a basic machine learning project with PyTorch";
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
    };
  };
}
