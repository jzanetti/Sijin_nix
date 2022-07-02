{
  pkgs ? import <nixpkgs> {}
}:

with pkgs;

let
  packages = rec {
    nc = callPackage pkgs/nc/default.nix {};
    zlib = callPackage pkgs/zlib/default.nix {};
    inherit pkgs;
  };
in
  packages