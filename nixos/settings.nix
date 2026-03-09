{ config, lib, pkgs, ... }:

{
  # Define a user account.
  users.users.rafid = {
    isNormalUser = true;
    description = "rafid";
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      tree
    ];
  };

  time.timeZone = "Asia/Dhaka";
  
  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };
  }; 
}
