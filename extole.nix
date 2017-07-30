{ config, pkgs, ... }:

{
  imports =
    [
      ./vpn/network-extole.nix
    ];

  networking.extraHosts = ''
    52.3.248.63 vpn.intole.net
    52.91.195.221 vpn.intole.net
    54.86.141.200 vpn.intole.net
  '';

  services.dnsmasq.enable = true;
  services.dnsmasq.extraConfig = ''
    server=/.intole.net/10.1.0.2
    conf-dir=/etc/dnsmasq.d
  '';

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
/home/mcyster/extole 10.11.14.16(insecure,rw,sync,no_subtree_check,all_squash,anonuid=2042,anongid=2042)
  '';

  users.extraGroups.mcyster = {
    gid = 2042;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mcyster = {
     isNormalUser = true;
     uid = 2042;
     group = "mcyster";
     extraGroups = [ "wheel" ];
  };

  security.sudo.wheelNeedsPassword = false;

  programs.virtualbox.enable=true;
}
