{ config, lib, pkgs, modulesPath, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.username = "rafid";
  home.homeDirectory = "/home/rafid";

  home.packages = with pkgs; [
    cava
    ghostty
    newsboat
    newsflash
    vicinae
    cmatrix
    pavucontrol
    libnotify
    
    # sfl
    obs-studio
    gimp
    discord
    ferdium
    obsidian
    thunderbird
    bitwarden-desktop
    onlyoffice-desktopeditors
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "voidwalter";
      email = "codeacean@proton.me";
      defaultBranch = "main";
    };
  };

  # Home Manager state version
  home.stateVersion = "25.05";
}
