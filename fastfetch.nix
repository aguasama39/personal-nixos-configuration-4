{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "small";
        padding.right = 2;
      };

      display = {
        separator = "  ";
        key.width = 10;
      };

      modules = [
        "title"
        "separator"
        { type = "os"; key = "System"; }
        { type = "kernel"; key = "Kernel"; }
        { type = "cpu"; key = "CPU"; }
        { type = "shell"; key = "Shell"; }
        { type = "uptime"; key = "Uptime"; }
        { type = "de"; key = "Desktop"; }
        { type = "memory"; key = "Memory"; }
        { type = "disk"; key = "Storage"; folders = "/"; }
        "colors"
      ];
    };
  };
}
