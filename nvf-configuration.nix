{ pkgs, ... }:
{
  vim = {
    binds = {
      whichKey.enable = true;
    };
    keymaps = [
      {
        key = "=";
        mode = "n";
        action = ":lua vim.lsp.buf.format()<Cr>";
      }
      {
        key = "<C-c>";
        mode = "n";
        action = "gcc";
        noremap = false;
      }
      {
        key = "<C-c>";
        mode = "v";
        action = "gc";
        noremap = false;
      }
      {
        key = "<Tab>";
        mode = "n";
        action = "<C-w>";
      }
      {
        key = "<C-i>";
        mode = "n";
        action = "<C-i>";
      }
      {
        key = "<C-space>";
        mode = "n";
        action = ":botright 10split | terminal<CR>";
      }
      {
        key = "<Esc>";
        mode = "t";
        action = "<C-\\><C-n>";
      }
      {
        key = "zz";
        mode = "n";
        action = "za";
      }
      {
        key = "za";
        mode = "n";
        action = "zA";
      }
      {
        key = "<C-f>";
        mode = "n";
        action = ":lua vim.lsp.buf.hover()<Cr>";
      }
      {
        key = "f2";
        mode = "n";
        action = ":lua vim.lsp.buf.rename()<Cr>";
      }
      {
        key = "<leader>a";
        mode = "n";
        action = ":lua vim.lsp.buf.code_action()<Cr>";
      }
    ];
    formatter.conform-nvim.enable = true;
    diagnostics = {
      enable = true;
      config = {
        virtual_lines = true;
      };
    };
    telescope = {
      enable = true;
      mappings = {
        diagnostics = "<leader>fd";
      };
    };
    undoFile.enable = true;
    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        close = "<C-c>";
      };
    };
    lsp.enable = true;
    treesitter = {
      indent.enable = true;
      fold = true;
      autotagHtml = true;
    };
    autopairs.nvim-autopairs.enable = true;
    options = {
      shiftwidth = 2;
      foldlevel = 6;
      scrolloff = 18;
      sidescrolloff = 10;
    };
    git = {
      gitsigns.enable = true;
      vim-fugitive.enable = true;
    };
    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      go.enable = true;
      rust = {
        enable = true;
        dap.enable = true;
        lsp.opts = ''
          ['rust-analyzer'] = 
                    {
                      diagnostics = {
                        enable = true,
                        experimental = {enable = true},
                      },
                  }'';
      };
      clang = {
        enable = true;
        cHeader = true;
        dap.enable = true;
      };
    };

    luaConfigRC.theme = "vim.cmd([[${builtins.readFile ./theme.vim}]])";
    statusline.lualine.enable = true;
    ui.borders.plugins.nvim-cmp = {
      enable = true;
      style = "double";
    };
    ui.colorizer = {
      enable = true;
      setupOpts.user_default_options.mode = "virtualtext";
    };
  };

}
