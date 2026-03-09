{ pkgs, ... }:

{
  programs.direnv.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    clang
    lld
    lldb
    rustup
    ruby

    vim
    tmux
    curl
    wget
    neovim
    vscodium
    
    devenv
    git
    lazygit
    license-generator
    git-ignore
    gitleaks
    gh
  ];
}
