{ inputs, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    rofi
    firefox
    nautilus
    qutebrowser
    inputs.zen-browser.packages.${pkgs.system}.twilight
  ];

}
