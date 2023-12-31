{ config, pkgs, ... }:

{
  home.username = "njrardin";
  home.homeDirectory = "/home/njrardin";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neofetch
    firefox
    tor-browser-bundle-bin
    bitwarden
    discord
    gtop
    zip
    unzip
    bat
    eza
    fzf
    fd
    grc
    sqlite
    obsidian
    inkscape
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  programs.git = {
    enable = true;
    userName = "njrardin";
    userEmail = "nathanaelrardin@gmail.com";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.fish = {
    enable = true;
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
    interactiveShellInit = builtins.readFile ./config/fish/config.fish;
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    theme = "Gruvbox Material Dark Hard";
    font = {
      name = "MesloLGS NF Regular";
    };
    extraConfig =
      ''
        background_opacity 0.85
      '';
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    extraConfig = builtins.readFile ./config/tmux/tmux.conf;
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
      coc-html
      coc-css
      coc-json
      coc-eslint
      coc-tsserver
      coc-svelte
      coc-sh
      coc-rls
      coc-prettier
      coc-go

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
      neoscroll-nvim
      nvim-autopairs
      nvim-ts-autotag
    ];

    extraPackages = with pkgs; [
      # languages
      nodejs
      rustc

      # language servers
      nixd
      lua-language-server
      nodePackages."bash-language-server"
      nodePackages."typescript"
      nodePackages."typescript-language-server"
      nodePackages."svelte-language-server"
      nodePackages."vscode-langservers-extracted"
      rust-analyzer
      gopls

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
    "nixpkgs/config.nix" = {
      text =
        ''
          {
            allowUnfree = true;
          }
        '';
    };
    "onedrive/sync_list" = {
      text = ''
        /Documents/Obsidian_Vault
        /Library
      '';
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

}
