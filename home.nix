{ config, pkgs, ... }:

{
  home.username = "njrardin";
  home.homeDirectory = "/home/njrardin";

  programs.git = {
    enable = true;
    userName = "njrardin";
    userEmail = "nathanaelrardin@gmail.com";
  };

  programs.gh = {
    enable = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    theme = "Gruvbox Material Dark Hard";
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
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
