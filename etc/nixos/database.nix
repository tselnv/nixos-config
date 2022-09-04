{ config, pkgs, ... }:

{

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_10;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE hauth WITH LOGIN PASSWORD 'hauth' CREATEDB;
      CREATE DATABASE hauth;
      GRANT ALL PRIVILEGES ON DATABASE hauth TO hauth;
    '';
  };
  
}
