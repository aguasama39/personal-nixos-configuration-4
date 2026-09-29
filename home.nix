{ config, pkgs, inputs, ... }:

{
  imports = [
    ./fish.nix
    ./kitty.nix
    ./git.nix
    ./fastfetch.nix
    ./caelestia.nix
  ];

  home.username = "paulcho";
  home.homeDirectory = "/home/paulcho";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  programs.starship.enable = true;

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.iosevka-term
  ];
}
