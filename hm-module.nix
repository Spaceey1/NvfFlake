{ inputs }:
{ config, lib, pkgs, ... }:
let
  cfg = config.programs.nvf;
  nvim = inputs.nvf.lib.neovimConfiguration {
    pkgs = import inputs.pkgs { system = pkgs.stdenv.hostPlatform.system; };
    modules = [
      (import ./nvf-configuration.nix)
    ];
  };
in {
  options.programs.nvf = {
    enable = lib.mkEnableOption "nvf Neovim configuration from this flake";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ nvim.neovim ];
  };
}
