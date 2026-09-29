{ config, pkgs, ... }:

{
  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/6a1f1540-9754-4c90-a00a-33361b6c6abd";
    fsType = "btrfs";
    options = [
      "defaults"
      "compress=zstd"
      "nofail"
    ];
  };

  fileSystems."/mnt/reinas" = {
    device = "//192.168.1.209/Medias";
    fsType = "cifs";
    options = [
      "credentials=/etc/samba/credentials"
      "uid=1000"
      "gid=100"
      "iocharset=utf8"
      "nofail"
      "x-systemd.automount"
    ];
  };

  environment.systemPackages = with pkgs; [
    cifs-utils
  ];
}
