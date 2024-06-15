{ pkgs ? import <nixpkgs> { }
, lib ? pkgs.lib
, stdenv ? pkgs.clangStdenv
}:

stdenv.mkDerivation rec {
  name = "test-sdl";
  src = ./.;

  buildInputs = with pkgs; [
    SDL2
  ];

  nativeBuildInputs = with pkgs; [
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
