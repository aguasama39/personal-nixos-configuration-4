{ ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "IosevkaTerm Nerd Font";
      font_size = 11;
      confirm_os_window_close = 0;
      hide_window_decorations = "yes";
      window_padding_width = 10;
      background_opacity = "0.78";
      dynamic_background_opacity = "yes";
      background_blur = 24;
    };

    # Caelestia CLI maintains this file when terminal theming is enabled.
    extraConfig = ''
      include dark-theme.auto.conf
    '';
  };
}
