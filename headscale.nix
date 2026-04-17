{nixosModulesPath, ...}: {
  imports = [(nixosModulesPath + "/services/networking/headscale.nix")];
  services.headscale = let
    domain = "partlyaweso.me";
    ts_domain = "on.${domain}";
    hs_domain = "https://head.to.${domain}";
  in {
    enable = true;
    address = "0.0.0.0";
    port = 64328;

    settings = {
      server_url = hs_domain;

      dns = {
        base_domain = ts_domain;
        # search_domains = [ts_domain];
        nameservers.global = [
          # cloudflare ipv4
          "1.1.1.1"
          "1.0.0.1"
          # cloudflare ipv6
          "2606:4700:4700::1111"
          "2606:4700:4700::1001"
          # google ipv4
          "8.8.8.8"
          "8.8.4.4"
          # google ipv6
          "2001:4860:4860::8888"
          "2001:4860:4860::8844"
        ];
      };
    };
  };
}
