{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [

  ];
}
