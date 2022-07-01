-- n, v, i, t = mode names
-- n = normal mode
-- v = visual mode
-- i = insert mode
-- t = terminal mode

local M = {}

M.general = {
  i = {
    -- go to beginning and end
    ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
    ["<C-e>"] = { "<End>", "壟 end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", " move left" },
    ["<C-l>"] = { "<Right>", " move right" },
    ["<C-j>"] = { "<Down>", " move down" },
    ["<C-k>"] = { "<Up>", " move up" },
  },
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", " no highlight" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", " window left" },
    ["<C-l>"] = { "<C-w>l", " window right" },
    ["<C-j>"] = { "<C-w>j", " window down" },
    ["<C-k>"] = { "<C-w>k", " window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "﬚ save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", " copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", " toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", " toggle relative number" },

    ["<leader>tt"] = {
      function()
        require("onedark").toggle()
      end,
      " toggle theme",
    }
  },
  t = {
    ["<C-x"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), " escape terminal mode" },
  },
}

M.nvimtree = {
  n = {
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "פּ toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "פּ focus nvimtree"}
  },
}

return M
