{ ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "IosevkaTerm Nerd Font";
      font_size = 11;
      confirm_os_window_close = 0;

      background_opacity = "0.6";
      dynamic_background_opacity = "yes";
    };

    extraConfig = ''
      include dark-theme.auto.conf
    '';
  };
}
