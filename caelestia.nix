{ config, pkgs, inputs, ... }:

let
  zenSync = pkgs.writeScript "caelestia-zen-sync" ''
    #!${pkgs.python3}/bin/python3

    import json
    from pathlib import Path

    scheme = Path.home() / ".local/state/caelestia/scheme.json"

    if not scheme.exists():
        raise SystemExit(0)

    try:
        data = json.loads(scheme.read_text())
        colors = data["colours"]
    except (OSError, json.JSONDecodeError, KeyError, TypeError):
        raise SystemExit(0)

    def colour(name):
        value = str(colors[name]).strip()
        return value if value.startswith("#") else f"#{value}"

    css = f"""
    :root {{
      --zen-primary-color: {colour("primary")} !important;
      --zen-colors-primary: {colour("primary")} !important;
      --zen-colors-secondary: {colour("surfaceContainer")} !important;
      --zen-colors-tertiary: {colour("surface")} !important;
    }}

    #navigator-toolbox,
    #zen-sidebar-web-panel,
    #zen-sidebar-top-buttons {{
      background-color: {colour("surface")} !important;
    }}

    .tabbrowser-tab[selected="true"] .tab-background {{
      background-color: {colour("primaryContainer")} !important;
    }}
    """.strip() + "\n"

    zen_root = Path.home() / ".config/zen"
    if not zen_root.exists():
        raise SystemExit(0)

    for chrome in zen_root.glob("*/chrome"):
        chrome.mkdir(parents=True, exist_ok=True)
        (chrome / "caelestia-colors.css").write_text(css)
  '';
in
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qtengine";
  };

  programs.caelestia = {
    enable = true;
    systemd.enable = false;

    settings = {
      services.smartScheme = true;
    };

    cli = {
      enable = true;

      settings = {
        theme = {
          enableTerm = true;
          enableHypr = true;
          enableDiscord = false;
          enableSpicetify = false;
          enablePandora = false;
          enableFuzzel = true;
          enableBtop = true;
          enableNvtop = true;
          enableHtop = true;
          enableGtk = true;
          enableQt = true;
          enableWarp = false;
          enableChromium = false;
          enableZed = false;
          enableCava = true;
          iconTheme = "Papirus-Dark";
          iconThemeLight = "Papirus-Light";
          iconThemeDark = "Papirus-Dark";
        };
      };
    };
  };

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles.default = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        @import url("caelestia-colors.css");
      '';
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "caelestia shell -d"
        "${zenSync}"
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, kitty"
        "$mod, Q, killactive"
        "$mod SHIFT, S, exec, caelestia screenshot"
        "$mod, M, exit"
      ];
    };
  };

  systemd.user.services.caelestia-zen-sync = {
    Unit = {
      Description = "Sync Zen Browser colours with Caelestia";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${zenSync}";
    };
  };

  systemd.user.paths.caelestia-zen-sync = {
    Unit = {
      Description = "Watch Caelestia scheme changes for Zen Browser";
    };

    Path = {
      PathChanged = "%h/.local/state/caelestia/scheme.json";
      Unit = "caelestia-zen-sync.service";
    };

    Install.WantedBy = [ "default.target" ];
  };
}
