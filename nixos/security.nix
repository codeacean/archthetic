{ pkgs, lib, host, ... }:

{
  networking = {
    hostName = "nixie";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = false;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };

  # Enable Security Services
  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
  };

  services.dbus.apparmor = "enabled";
  programs.firejail = {
    enable = true;
    wrappedBinaries = { 
      mpv = {
        executable = "${lib.getBin pkgs.mpv}/bin/mpv";
        profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
      };
      imv = {
        executable = "${lib.getBin pkgs.imv}/bin/imv";
        profile = "${pkgs.firejail}/etc/firejail/imv.profile";
      };
      zathura = {
        executable = "${lib.getBin pkgs.zathura}/bin/zathura";
        profile = "${pkgs.firejail}/etc/firejail/zathura.profile";
      };
      qutebrowser = {
        executable = "${lib.getBin pkgs.qutebrowser}/bin/qutebrowser";
        profile = "${pkgs.firejail}/etc/firejail/qutebrowser.profile";
      };
      vscodium = {
        executable = "${lib.getBin pkgs.vscodium}/bin/vscodium";
        profile = "${pkgs.firejail}/etc/firejail/vscodium.profile";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gnupg
    openssl
    networkmanagerapplet
  ];
}
