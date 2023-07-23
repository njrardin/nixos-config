{
  description = "Nate Rardin's NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    formatter.${system} = pkgs.nixpkgs-fmt;
    nixosConfigurations = {
      "njrardinMSI" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
        ];
      };
    };
    homeConfigurations = {
      "njrardin" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
	  inherit system;
	  config.allowUnfree = true;
	};
        modules = [
          ./home.nix
        ];
      };
    };
    devShells.${system} = {
      # Used to bootstrap initialization of home-manager
      default = (import ./bootstrap-shell.nix { inherit pkgs; });
      # Generalized nodejs development environment
      nodejs = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs
          nodePackages.npm
          nodePackages.prettier
          nodePackages.eslint
          typescript
          nodePackages.typescript-language-server
        ];
      };
    };
  };
}
