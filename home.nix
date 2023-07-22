{ config, pkgs, ... }:

{
  home.username = "njrardin";
  home.homeDirectory = "/home/njrardin";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

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
      # lanuguage plugins
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      coc-nvim
      coc-lua

      # telescope
      telescope-nvim
      plenary-nvim

      # misc.
      gruvbox-material
      copilot-lua
      which-key-nvim
      gitsigns-nvim
      lualine-nvim
      nvim-web-devicons
      vimwiki
    ];
    
    extraPackages = with pkgs; [
      # languages
      nodejs
      rustc

      # language servers
      nil
      nixd
      lua-language-server
      nodePackages."bash-language-server"
      nodePackages."typescript"
      nodePackages."typescript-language-server"
      nodePackages."vscode-langservers-extracted"
      rust-analyzer

      # formatters
      nixpkgs-fmt
      rustfmt

      # tools
      cargo
      gcc
      ghc

      # telescope deps
      ripgrep
    ];
  };

  xdg.configFile = {
    "nvim" = {
      recursive = true;
      source = ./config/nvim;
    };
  };
    	
  # Enables redshift (a linux f.lux alternative)
  services.redshift = {
    enable = true;
    latitude = 41.881832;
    longitude = -87.623177;
    duskTime = "22:00";
    dawnTime = "6:30";
  };

  # Visual Studio Code
  programs.vscode = {
    enable = true;
  };

  home.packages = with pkgs; [
    neofetch
    firefox
    tor-browser-bundle-bin
    bitwarden
    discord
    zip
    unzip
    bat
    exa
    tmux
    fzf
    fd
    grc
    sqlite
  ];
}
