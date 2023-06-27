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
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    theme = "Gruvbox Material Dark Hard";
    font = {
      name = "MesloLGS NF Regular";
    };
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
