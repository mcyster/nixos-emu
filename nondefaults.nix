# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  services.openssh.enable = true;
  services.netdata.enable = true;
  environment.systemPackages = with pkgs; [
    vim
  ];
}
