{ cabal, aeson, base64Bytestring, blazeBuilder, caseInsensitive
, cryptohash, cryptoRandom, either, exceptions, httpClient
, httpTypes, mtl, network, text, time, transformers
}:

cabal.mkDerivation (self: {
  pname = "oauthenticated";

  version = "0.1.3";
  src = ./.;
  #
  # sha256 = "12f9w8s5ir3skdr2dhlvr94f3sfbqjky5ppc943wj60sz0s7lha1";
  # jailbreak = true; # workaround 'exceptions ==0.3.*' constraint
  #

  buildDepends = [
    aeson base64Bytestring blazeBuilder caseInsensitive cryptohash
    cryptoRandom either exceptions httpClient httpTypes mtl network
    text time transformers
  ];
  meta = {
    description = "Simple OAuth for http-client";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
