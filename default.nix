with import <nixpkgs>{};
{ pkgs ? import <nixpkgs> {} }:

stdenv.mkDerivation rec {
  name = "cryptounicorns.io-unstable-${version}";
  version = "2017-11-14";

  system = builtins.currentSystem;
  src = ./.;
}
