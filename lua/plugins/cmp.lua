-- All plugins have lazy = true by default.

local opts = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  local options = {
    completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }),
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(
            vim.api.nvim_replace_termcodes(
              "<Plug>luasnip-expand-or-jump",
              true,
              true,
              true
            ),
            ""
          )
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(
            vim.api.nvim_replace_termcodes(
              "<Plug>luasnip-jump-prev",
              true,
              true,
              true
            ),
            ""
          )
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm(),
    }),
  }

  return options
end

local plugin = {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
    }, -- dependencies
    opts = opts,
  },
}

return plugin
