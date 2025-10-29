return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "asm_lsp", "rust_analyzer", "basedpyright" , "ruff" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("asm_lsp", { capabilities = capabilities })
      vim.lsp.config("rust_analyzer", { capabilities = capabilities })
      vim.lsp.config("basedpyright", {
        capabilities = capabilities,
        settings = {
          basedpyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use ruff for linting
              ignore = { '*' },
            },
          },
        },
      })
      vim.lsp.config("ruff", { capabilities = capabilities })
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("asm_lsp")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("ruff")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end
          if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = 'LSP: Disable hover capability from Ruff',
      })
         end,

    keys = {
      { "gD",         vim.lsp.buf.declaration },
      { "gd",         vim.lsp.buf.definition },
      { "K",          vim.lsp.buf.hover },
      { "<leader>rn", vim.lsp.buf.rename },
      { "<leader>ca", vim.lsp.buf.code_action },
    },
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-shell-escape",
        },
      }
    end,
  },
}
