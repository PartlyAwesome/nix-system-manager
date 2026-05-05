{
  pkgs,
  nixosModulesPath,
  ...
}: {
  imports = [(nixosModulesPath + "/services/web-servers/caddy")];
  services.caddy = {
    enable = true;
    configFile = /etc/caddy/Caddyfile;
    package = pkgs.caddy.withPlugins {
      plugins = [
        "github.com/caddy-dns/cloudflare@v0.2.4"
        "github.com/tailscale/caddy-tailscale@v0.0.0-20260106222316-bb080c4414ac"
      ];
      hash = "sha256-LIcgZi32N0V5IGZPJbyI+n2YegXRjH/R/+lO2kzkCaI=";
    };
  };
}
