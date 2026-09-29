{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    chromium
    fastfetch
    pciutils
    nano
    kitty
    ffmpeg
    cifs-utils
    unrar
    proton-vpn-cli
    gearlever
    nicotine-plus
    rmpc
    mpd
    mpc
    pavucontrol
  ];

}
