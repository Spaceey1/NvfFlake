{
  description = "flake containing my NVF config";

  inputs = {
    pkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf = {
      url = "github:NotAShelf/nvf";
    };
  };

  outputs = inputs: {
    packages.x86_64-linux.default =
      (inputs.nvf.lib.neovimConfiguration {
        pkgs = import inputs.pkgs { system = "x86_64-linux"; };
        modules = [ ./nvf-configuration.nix ];
      }).neovim;
  };
}
