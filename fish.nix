{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      fastfetch
    '';

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      nixconf = "sudo nano /etc/nixos/configuration.nix";
      fishconf = "sudo nano /etc/nixos/fish.nix";
      pkgconf = "sudo nano /etc/nixos/modules/packages.nix";
      flake = "sudo nano /etc/nixos/flake.nix";
      update = "cd /etc/nixos && sudo nix flake update && git add . && sudo nixos-rebuild switch --flake .#nixos";
      home = "sudo nano /etc/nixos/home.nix";
    };
  };
}
