{ inputs, ... }:
{
  services.flatpak = {
    enable = true;
    remotes = [
      { name = "flathub"; location = "https://dl.flathub.org"; }
    ];
    packages = [ 
      "com.github.tchx84.Flatseal"
      "org.kde.gwenview"
      "com.infinipaint.infinipaint"
    ];
  };
}
