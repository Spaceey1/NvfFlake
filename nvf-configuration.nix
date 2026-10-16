{ ... }:
{
  vim = {
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
        key = "<F2>";
        mode = "n";
        action = ":lua vim.lsp.buf.rename()<Cr>";
      }
      {
        key = "<leader>a";
        mode = "n";
        action = ":lua vim.lsp.buf.code_action()<Cr>";
      }
      {
        key = "<C-x>";
        mode = "n";
        action = ":noh<Cr>";
      }
      {
        key = "<leader>e";
        mode = "n";
        action = ":Vexplore<Cr>";
      }
    ];
    formatter.conform-nvim.enable = true;
    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
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
    lsp = {
      enable = true;
      servers = {
        rust-analyzer = {
          enable = true;
          opts = {
            diagnostics = {
              enable = true;
            };
          };
        };
      };
    };
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
      mouse = "";
    };
    git = {
      gitsigns.enable = true;
      vim-fugitive.enable = true;
    };
    languages = {
      enableTreesitter = true;
      enableFormat = true;
      enableDAP = true;

      clang = {
        enable = true;
        cHeader = true;
      };
      nix.enable = true;
      go.enable = true;
      rust.enable = true;
      python.enable = true;
      lua.enable = true;
      java.enable = true;
      fish.enable = true;
      bash.enable = true;
      csharp.enable = true;
    };
    luaConfigRC.theme = "vim.cmd([[${builtins.readFile ./theme.vim}]])";
    statusline.lualine = {
      enable = true;
      setupOpts.sections.lualine_b = [
        {
          "@1" = "filename";
          path = 1;
          separator.right = "";
        }
      ];
    };
    ui.borders = {
      enable = true;
      globalStyle = "shadow"; # Options: "none", "single", "double", "rounded", "solid", "shadow"
    };
    ui.colorizer = {
      enable = true;
    };
    clipboard = {
      enable = true;
      registers = "unnamed";
      providers.wl-copy.enable = true;
    };
    extraLuaFiles = [
      (builtins.toFile "config.lua" "
        vim.cmd('cnoreabbrev q q!')
        vim.cmd('cnoreabbrev wq wqa!')
      ")
    ];
  };
}
