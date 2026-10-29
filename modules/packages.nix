{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    fastfetch
    pciutils
    nano
    kitty
    ffmpeg
    cifs-utils
    kdePackages.ark
    nicotine-plus
    pavucontrol
    kdePackages.filelight
    brave
  ];

}
