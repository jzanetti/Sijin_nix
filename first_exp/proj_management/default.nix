{
  pkgs ? import <nixpkgs> {}
}:

with pkgs;

let
  packages = rec {
    zlib = callPackage pkgs/zlib/default.nix {};
    nc = callPackage pkgs/nc/default.nix {};
    inherit pkgs;
  };
in
  packages