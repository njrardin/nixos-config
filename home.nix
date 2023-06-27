{ config, pkgs, ... }:

{
  home.username = "njrardin";
  home.homeDirectory = "/home/njrardin";

  programs.git = {
    enable = true;
    userName = "njrardin";
    userEmail = "nathanaelrardin@gmail.com";
  };

  home.packages = with pkgs; [
    neofetch
    neovim
    firefox
    bitwarden
    zip
    unzip
    bat
    exa
    tmux
    gh
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
