{ stdenv, fetchurl, gcc, m4, cmake, zlib }:

stdenv.mkDerivation rec {
    pname = "netcdf-c";
    version = "3.9-test";

    src = fetchurl {
        url = "https://downloads.unidata.ucar.edu/netcdf-c/4.9.0/netcdf-c-4.9.0.tar.gz";
        sha256 = "sha256-TJVgIrecCOXhTu6N9RsTwo5hIcK35/qtwhs3WUlAC0k=";
    };

    buildInputs = [
        cmake
        gcc
        m4
        zlib
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
}