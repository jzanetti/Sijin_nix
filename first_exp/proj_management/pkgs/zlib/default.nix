{ stdenv, fetchurl, gcc, cmake }:

stdenv.mkDerivation rec {
    pname = "zlib";
    version = "1.2.12-test";

    src = fetchurl {
        url = "https://zlib.net/zlib-1.2.12.tar.gz";
        sha256 = "sha256-kYRICFMuXOMWs8AQkpSTwCRPPTdZOv1t4E9xgh1RNtk=";
    };

    buildInputs = [
        cmake
        gcc
    ];

    configurePhase = ''
        ./configure --prefix /tmp/tmp/zlib-install
    '';

    buildPhase = ''
        make
    '';

    installPhase = ''
        make install
        mkdir -p $out
        mv /tmp/tmp/zlib-install/* $out
    '';
}