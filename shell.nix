with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "nix-cage-shell";
  buildInputs = [
    nodePackages.tern
    nodejs-8_x
  ];
}
