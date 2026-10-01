{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    chromium
    fastfetch
    pciutils
    nano
    kitty
    ffmpeg
    cifs-utils
    unrar
    nicotine-plus
    pavucontrol
    kdePackages.filelight
  ];

}
