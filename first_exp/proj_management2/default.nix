{
  pkgs ? import <nixpkgs> {}
}:

with pkgs;

let
  packages = rec {
    nc = callPackage pkgs/nc/default.nix { zlib = zlib_customized; };
    zlib_customized = callPackage pkgs/zlib/custom.nix {};

    inherit pkgs;
  };
in
  packages