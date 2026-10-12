{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl

    pkgs-unstable.brave-origin
    
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
  ];

}
