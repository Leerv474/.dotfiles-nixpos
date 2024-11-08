{ pkgs, ...}:
let 
unstable = import <unstable> {};
in
{
  environment.systemPackages = with pkgs; [

# best
    tmux
    zsh
    zsh-syntax-highlighting
    fzf
    lazygit
    # yazi
    unstable.fastfetch
    tldr
    starship
    bat
    zoxide

# media
    imv
    mplayer

# needed
    killall
    tree
    file
    wget
    unstable.git
    btop
    unzip
    zip
    ripgrep
    fd 
    tree-sitter

# system
    bluez
    bluez-tools
    brightnessctl
  ];
}
