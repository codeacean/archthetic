{ inputs, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    jq
    fzf
    btop
    yazi
    blesh
    kitty
    zoxide
    starship
    quickshell
    fastfetch
    zathura
    mpv
    mpv-handler
    imv
    at-spi2-atk
    qt6.qtwayland
    playerctl
    psmisc
    pamixer
    grim
    slurp
    imagemagick
    swappy
    ffmpeg
    ffmpeg_6-full
    wl-screenrec
    wl-clipboard
    wl-clip-persist
    cliphist
    xdg-utils
    wtype
    wlrctl
    dunst
    avizo
    gifsicle
    ddcutil
    brightnessctl
    libfido2
  ];

  programs.bash = {
    enable = true; 
    blesh.enable = true;
    interactiveShellInit = ''
      if [ -f ~/.bashrc ]; then
          source ~/.bashrc
      fi
    '';
  };

  programs.direnv.enable = true;
  programs.dconf.enable = true;
}
