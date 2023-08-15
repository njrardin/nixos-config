# NJR Fish Config

## Alternative fish greetig
function fish_greeting
    echo ""
    echo "  <~ Welcome back, Nate! ~>"
    echo ""
end

## Variables
set EDITOR 'nvim'
set NIXOS_CONFIG_DIRECTORY '/etc/nixos'

## Functions
function edit_directory
    # Store the current directory in a variable
    set old_dir (pwd)

    # Check if an argument (directory path) is provided
    if test -n "$argv"
        # Change to the specified directory
        cd $argv[1]
    else
        echo "Usage: edit_directory /path/to/directory"
        return 1
    end

    # Open NeoVim
    nvim .

    # After NeoVim is closed, return to the original directory
    cd $old_dir
end

## Enters a specified devshell in a nixos config flake
function use_nixos_devshell
    set nixos_config_path (realpath $NIXOS_CONFIG_DIRECTORY)
    nix develop $nixos_config_path\#$argv
end

## Aliases
alias nixconf 'edit_directory $NIXOS_CONFIG_DIRECTORY'
alias nixdev 'use_nixos_devshell'
