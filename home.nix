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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      which-key-nvim
      mason-nvim
      telescope-nvim
      gitsigns-nvim
      plenary-nvim
      lualine-nvim
      nvim-web-devicons
    ];
  };

  home.packages = with pkgs; [
    neofetch
    firefox
    bitwarden
    discord
    zip
    unzip
    bat
    exa
    tmux
    fzf
    grc
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
