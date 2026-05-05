{nixosModulesPath, ...}: {
  imports = [(nixosModulesPath + "/services/web-servers/caddy")];
  services.caddy = let
    # domain = "partlyaweso.me";
    # ts_domain = "on.${domain}";
    # hs_domain = "https://head.to.${domain}";
  in {
    enable = true;
    configFile = /etc/caddy/Caddyfile;
  };
}
