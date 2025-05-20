{ lib
  , buildPythonPackage
  , pythonOlder
  , cmake
  , scikit-build-core
  , ninja
  , pybind11
  , spdlog
  , numpy
}:

buildPythonPackage rec {
  pname = "starterpp";
  version = "1.0.0";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = ../.;

  build-system = [ scikit-build-core ninja cmake pybind11 ];
  dontUseCmakeConfigure = true;
  
  dependencies = [
    numpy
  ];

  buildInputs = [
    spdlog
  ];

  pythonImportCheck = [ "starterpp" ];

  meta = with lib; {
    description = ''
      An example nix powered pybind11 starter skeleton
    '';
    homepage = "https://github.com/nixvital/flake-templates/tree/main/templates/pybind11-starter-kit";
    license = licenses.mit;
    maintainers = with maintainers; [ breakds ];
  };
}
