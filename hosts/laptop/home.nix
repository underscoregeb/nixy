{ pkgs, config, ... }: {

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/btop
    ../../home/programs/cava
    ../../home/programs/kitty
    ../../home/programs/nextcloud
    ../../home/programs/nvim
    ../../home/programs/qutebrowser
    # ../../home/programs/spicetify TODO: broken
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/lf
    ../../home/programs/git
    ../../home/programs/yazi

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/gtk
    ../../home/system/batsignal
    ../../home/system/zathura
    ../../home/system/hyprland
    ../../home/system/wlogout
    ../../home/system/wofi
    ../../home/system/mime
    ../../home/system/udiskie

    ./secrets # You should probably remove this line
  ];

  home = {
    inherit (config.var) username;
    inherit (config.var) homeDirectory;

    packages = with pkgs; [
      discord
      xfce.thunar
      bitwarden
      vlc
      nextcloud-client
      tailscale
      wireguard-tools

      # Dev
      go
      nodejs
      python3
      jq
      nurl
      prefetch-npm-deps
      figlet

      # Utils
      zip
      unzip
      glow
      optipng
      pfetch
      pandoc

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix

      # Backup
      vscode
      firefox
      neovide
    ];

    # Import wallpapers into $HOME/wallpapers
    file."wallpapers" = {
      recursive = true;
      source = ../../home/wallpapers;
    };

    # Import or profile picture
    file.".profile_picture.png" = { source = ./profile_picture.png; };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
