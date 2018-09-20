with import <nixpkgs> {}; {
  sdlEnv = stdenv.mkDerivation {
    name="cmake_demonstration";
    buildInputs = [
      cmake
      git
    ];
  };
}
