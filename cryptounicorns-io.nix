with import <nixpkgs>{};
{ pkgs ? import <nixpkgs> {} }:

stdenv.mkDerivation rec {
  name = "cryptounicorns.io-unstable-${version}";
  version = "development";

  system = builtins.currentSystem;
  src = ./.;
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup
    cd $src
    make
    make install
  '';
}
