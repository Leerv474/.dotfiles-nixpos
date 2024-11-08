{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        hyprland
        xwayland
        xdg-desktop-portal-hyprland
        hyprpaper
        hypridle
        hyprlock
        hyprshot
        waybar
        rofi-wayland
        kitty
        pavucontrol
        wl-clipboard
        pulseaudio
    ];
}
