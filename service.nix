{ config, lib, pkgs, ... }:

with builtins;
with lib;

let
  name = "cryptounicorns-io";
  cfg = config.services."${name}";
  app = pkgs.callPackage ./default.nix { };
in {
  options = with types; {
    services."${name}" = {
      enable = mkEnableOption "Cryptounicorns website.";
      domain = mkOption {
        type = str;
        default = "cryptounicorns.io";
        description = ''
          Domain which should be used for the website.
        '';
      };
      https = mkOption {
        type = bool;
        default = true;
        description = ''
          Use HTTPS or not, this should be always true,
          it could be false only for tests.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    services.nginx = {
      enable = true;
      virtualHosts."${cfg.domain}" = {
        enableACME = cfg.https;
        forceSSL = cfg.https;
        serverName = cfg.domain;
        serverAliases = ["www.${cfg.domain}"];
        root = "${app}";
      };
    };
  };
}
