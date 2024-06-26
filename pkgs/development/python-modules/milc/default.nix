{ lib
, buildPythonPackage
, fetchFromGitHub
, appdirs
, argcomplete
, colorama
, halo
, nose2
, semver
}:

buildPythonPackage rec {
  pname = "milc";
  version = "1.4.2";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "clueboard";
    repo = "milc";
    rev = version;
    hash = "sha256-aX6cTpIN9+9xuEGYHVlM5SjTPLcudJFEuOI4CiN3byE=";
  };

  propagatedBuildInputs = [
    appdirs
    argcomplete
    colorama
    halo
  ];

  nativeCheckInputs = [
    nose2
    semver
  ];

  pythonImportsCheck = [ "milc" ];

  meta = with lib; {
    description = "An Opinionated Batteries-Included Python 3 CLI Framework";
    mainProgram = "milc-color";
    homepage = "https://milc.clueboard.co";
    license = licenses.mit;
    maintainers = with maintainers; [ bhipple ];
  };
}
