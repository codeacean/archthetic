{ config, inputs, pkgs, ... }:

let
  hyprPlugins = inputs.hyprland-plugins.packages.${pkgs.system};

in
{
  imports = [inputs.hyprland.nixosModules.default];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    plugins = {
      #...
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  #environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  environment.systemPackages = with pkgs; [
    pyprland
    hyprlock
    hypridle
    hyprshot
    hyprpaper
    hyprpicker
    hyprcursor
    hyprsunset
    hyprsysteminfo
    hyprpolkitagent
  ];
}
