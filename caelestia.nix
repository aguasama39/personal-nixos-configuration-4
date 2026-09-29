{ inputs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    systemd.enable = false;

    settings = {
      services = {
        smartScheme = true;
        clockFormat = "12h";
      };

      background = {
        enabled = true;
        wallpaperEnabled = true;
        desktopClock = {
          enabled = true;
          scale = 1.35;
          position = "top-right";
          invertColors = false;
          background.enabled = false;
          shadow = {
            enabled = true;
            opacity = 0.7;
            blur = 0.4;
          };
        };
      };

      appearance.transparency = {
        enabled = true;
        base = 0.82;
        layers = 0.35;
      };

      bar = {
        persistent = true;
        showOnHover = true;
        clock = {
          background = false;
          showDate = true;
          showIcon = true;
        };
      };
    };

    cli = {
      enable = true;
      settings.theme = {
        enableTerm = true;
        enableHypr = true;
        enableFuzzel = true;
        enableBtop = true;
        enableNvtop = true;
        enableHtop = true;
        enableGtk = true;
        enableQt = true;
        enableCava = true;
        enableChromium = true;
        iconTheme = "Papirus-Dark";
        iconThemeLight = "Papirus-Light";
        iconThemeDark = "Papirus-Dark";
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {
      exec-once = [ "caelestia shell -d" ];

      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, kitty"
        "$mod, Q, killactive"
        "$mod SHIFT, S, exec, caelestia screenshot"
        "$mod, M, exit"
      ];
    };
  };
}
