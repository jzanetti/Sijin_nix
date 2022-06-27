{ 
 # pkgs ? import (fetchTarball https://channels.nixos.org/nixpkgs-22.05-darwin/nixexprs.tar.xz) {} # use default
  pkgs ? import <nixpkgs> {} # use default
}:

with pkgs; 

let
    packages = rec {
        nc = pkgs.stdenv.mkDerivation rec {
            pname = "netcdf-c";
            version = "3.9-test";

            src = pkgs.fetchurl {
                url = "https://downloads.unidata.ucar.edu/netcdf-c/4.9.0/netcdf-c-4.9.0.tar.gz";
                sha256 = "sha256-TJVgIrecCOXhTu6N9RsTwo5hIcK35/qtwhs3WUlAC0k=";
            };

            buildInputs = [
                pkgs.cmake
                pkgs.gcc
                pkgs.m4
                pkgs.zlib
            ];

            configurePhase = ''
                ./configure --disable-netcdf4 --disable-hdf5 --prefix /tmp/tmp/netcdf-install
            '';

            buildPhase = ''
                make
            '';

            installPhase = ''
                make install
                mkdir -p $out
                mv /tmp/tmp/netcdf-install/* $out
            '';
        };
     # The shell of our experiment runtime environment
        expEnv = mkShell rec {
            name = "exp01Env";
            buildInputs = [nc];
        };
};
in 
    packages 