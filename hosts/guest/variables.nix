{ config, ... }: {
  imports = [ ../shared/variables-config.nix ];

  config.var = {
    hostname = "nixy";
    username = "your_username";
    homeDirectory = "/home/" + config.var.username;

    keyboardLayout = "fr";

    timeZone = "Europe/Paris";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "fr_FR.UTF-8";

    git = {
      username = "your_username";
      email = "your_email";
    };

    stateVersion = "24.05";

    autoUpgrade = false;
    autoGarbageCollector = false;
    sops = false;
    nextcloud = false;

    theme = import ../themes/nixy.nix;
  };
}