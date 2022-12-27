# Nixvital - Flake Templates

This repository contains a collection of Nix flake templates that you can use as starting points for your own projects. The templates are defined in the templates attribute set of the flake's outputs.

To use a template, you can use the `nix flake init` command and specify the template with the `--template` flag:

```
nix flake init --template "github:nixvital/flake-templates#torch-basics"
```

Alternatively, you can use the `nix flake new` command to create a new flake project in a new directory:

```
nix flake new --template "github:nixvital/flake-templates#torch-basics" my-project
```

The available templates in this repository are:

* `torch-basics`: a template for a basic machine learning project with PyTorch
* `cpp-starter-kit`: a template for a c++ development project skeleton with `CMake`

## Customizing the Templatesn

Each template contains a `flake.nix` file that defines the structure of the flake. You can customize the flake by modifying the `flake.nix` file and the other files in the template.

-----

This `README.md` file was generated with the help of [ChatGPT](https://openai.com/blog/chatgpt/), a language model trained by [OpenAI](https://openai.com/).


