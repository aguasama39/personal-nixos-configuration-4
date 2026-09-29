{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # SDDM automatically starts the Hyprland session.
  services.displayManager = {
    sddm.enable = true;
    defaultSession = "hyprland";

    autoLogin = {
      enable = true;
      user = "paulcho";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    grim
    slurp
    swappy
    wl-clipboard
    cliphist
    fuzzel
  ];
}
