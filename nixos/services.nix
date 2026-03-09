{ pkgs, ... }:

{    
  # Display Manager 
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time --time-format '%I:%M %p | %a • %h | %F' \
          --cmd 'uwsm start hyprland'";
        user = "greeter";
      };
    };
  };

  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      xfconf
      gnome2.GConf
    ];
  };
}
