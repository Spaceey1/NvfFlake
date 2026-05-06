{ pkgs, ... }:
{
  vim = {
    theme = {
      enable = true;
      style = "darker";
      name = "onedark";
    };
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    lsp.enable = true;
    treesitter.indent.enable = true;
    options = {
      shiftwidth = 2;
    };
    languages = {
      enableTreesitter = true;

      nix.enable = true;
      go.enable = true;
      clang = {
        enable = true;
        cHeader = true;
        dap.enable = true;
      };
    };
  };

}
