# NJR NixOS configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Additional hardware configuration and hardware-configuration.nix overrides
  hardware.bluetooth.enable = true;

  hardware.nvidia = {
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    # for hyprland compatability
    modesetting.enable = true;
  };

  # GRUB 2 Bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      configurationLimit = 10;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # NixOS garbage collection and cache optimizations
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1m";
    };
    settings.auto-optimise-store = true;
  };

  # Networking configuration
  networking = {
    networkmanager.enable = true;
    hostName = "njrardinMSI";
  };

  # Sets time zone.
  time.timeZone = "America/Chicago";

  # Sets internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Configures the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];

    # Enable the KDE Plasma Desktop Environment.
    # desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;

    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";

    # Additional xserver config
    libinput = {
      enable = true;
      touchpad = {
        disableWhileTyping = true;
        naturalScrolling = true;
      };
      mouse = {
        transformationMatrix = "0.85 0 0 0 0.85 0 0 0 1";
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Font installations
  fonts.packages = with pkgs; [
    meslo-lgs-nf
    open-sans
  ];

  # Defines my (Nathanael Rardin's) user account
  users.users.njrardin = {
    isNormalUser = true;
    description = "Nathanael Rardin";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  # kdeconnect
  programs.kdeconnect.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hyprland
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
  hardware.opengl.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    xclip
    onedrive
    # hyprland apps
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"];
      })
    )
    dunst
    libnotify
    swww
    rofi-wayland
    networkmanagerapplet
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
