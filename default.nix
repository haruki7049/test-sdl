{
  lib,
  stdenv,

  # Deps
  SDL2,

  # Dep tools
  patchelf,
}:

stdenv.mkDerivation rec {
  name = "test-sdl";
  src = lib.cleanSource ./.;

  buildInputs = [
    SDL2
  ];

  nativeBuildInputs = [
    patchelf
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;

  buildPhase = ''
    $CC -Wall src/main.c -o main -lSDL2
  '';

  installPhase = ''
    mkdir -p $out/bin
    install main $out/bin/test-sdl
  '';

  #postInstallPhase = ''
  #  patchelf --set-rpath $LD_LIBRARY_PATH $out/bin/test-sdl
  #'';
}
