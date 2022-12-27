{
  description = "A collection of flake templates as starting points for your awesome projects";

  outputs = { self, nixpkgs, ... }@inputs: {
    templates = {
      torch-basics = {
        path = ./templates/torch-basics;
        description = "Template for a basic machine learning project with PyTorch";
      };

      cpp-starter-kit = {
        path = ./templates/cpp-starter-kit;
        description = "A nix based c++ development project skeleton with CMake";
      };
    };
  };
}
