{ pkgs, ... }:
let 
unstable = import <unstable> { config.allowUnfree = true; };
in
{
  environment.systemPackages = with pkgs; [
    firefox
    telegram-desktop
    teams-for-linux
    unstable.neovim
    libreoffice-fresh
    obs-studio
    unstable.discord
    zoom-us

    # coding
    unstable.jetbrains.idea-community
    dbeaver-bin
    hoppscotch
    docker
    docker-compose
    drawio

  ];

  virtualisation.docker.enable = true;
}

