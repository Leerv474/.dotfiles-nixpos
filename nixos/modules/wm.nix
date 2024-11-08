{ pkgs, ... }:

let tokyo-night-sddm = pkgs.libsForQt5.callPackage ./sddm.nix { };
in 
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "tokyo-night-sddm";
  };

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
      weston
      bibata-cursors
      tokyo-night-sddm
      tokyonight-gtk-theme
  ];
}
