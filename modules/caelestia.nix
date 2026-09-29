{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  # Enable Hyprland for the Caelestia session.
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = [
    inputs.qtengine.packages.${system}.default
    inputs.darkly.packages.${system}.default
    pkgs.papirus-icon-theme

    # Caelestia CLI helpers.
    pkgs.grim
    pkgs.slurp
    pkgs.swappy
    pkgs.wl-clipboard
    pkgs.cliphist
    pkgs.fuzzel
  ];
}
