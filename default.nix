{ cabal, aeson, base64Bytestring, blazeBuilder, caseInsensitive
, cryptohash, cryptoRandom, either, exceptions, httpClient
, httpTypes, mtl, network, text, time, transformers
}:

cabal.mkDerivation (self:
let
  lib         = self.stdenv.lib;
  isWithin    = p: dirPath: lib.hasPrefix (toString dirPath) (toString p);
  cabalFilter = path: type: (
                               !(lib.hasSuffix "~" (toString path)) &&
                               !(lib.hasSuffix "#" (toString path)) &&
                               !(lib.hasPrefix "." (toString path)) &&
                               (
                                   baseNameOf path == "oauthenticated.cabal" ||
                                   baseNameOf path == "LICENSE"              ||
                                   baseNameOf path == "Setup.hs"             ||
                                   isWithin   path ./src                     ||
                                   false
                               )
                            );
in {
  pname = "oauthenticated";

  version = "0.1.3";
  src = builtins.filterSource cabalFilter ./.;
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
