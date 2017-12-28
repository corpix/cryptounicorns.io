with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "cryptounicorns-shell";
  buildInputs = [
    nodePackages.tern
    nodejs-8_x
  ];
}
