{ pkgs ? import <nixpkgs> {}}:

with pkgs;

stdenv.mkDerivation {
  name = "iogrt.github.com";

  src = lib.cleanSource ./.;

  buildInputs = [
    (jekyll.override { withOptionalDependencies = true; })
    glibcLocales
  ];

  LANG = "en_US.utf8";

  buildPhase = ''
    jekyll build
  '';

  installPhase = ''
    mkdir -p $out
    cp -R _site/* $out
  '';
}
