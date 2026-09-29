{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "aguasama39";
        email = "agautrump@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      credential = {
        helper = "";
      };

      safe = {
        directory = "/etc/nixos";
      };
    };
  };
}
