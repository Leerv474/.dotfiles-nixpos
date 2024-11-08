{ pkgs, ... }: 
let unstable = import <unstable> { config.allowUnfree = true; };
in
{
  environment.systemPackages = with pkgs; [
    python3
    nodejs

    # cpp, c
    gcc
    cmake
    gnumake

    # for neovim
    lua
    luajitPackages.luarocks
    cargo
    go

    # java
    jdk17
    maven

    # sqlite
    sqlite

    # lsps
    lua-language-server
    pyright
    unstable.typescript-language-server
    vscode-langservers-extracted # html css json eslint
    unstable.sqls
    marksman
    yaml-language-server
    unstable.bash-language-server
    unstable.nil

    # formatters
    prettierd
    stylua
    isort
    black
    beautysh

    # linters 
    cpplint
    pylint
    eslint_d
  ];
}
