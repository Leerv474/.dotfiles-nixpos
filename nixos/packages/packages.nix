{ pkgs, ... }: 
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  fonts.packages = with pkgs; [
   jetbrains-mono
   times-newer-roman
   (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
