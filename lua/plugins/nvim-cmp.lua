return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "R-nvim/cmp-r",
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },

  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")
    --- this must be changed
    local filename_without_ext = function()
      return vim.fn.expand("%:t:r")
    end

    -- Snippet for Typescript React Function Component
    luasnip.add_snippets("typescriptreact", {
      luasnip.snippet({
        trig = "fc",
        namr = "Typescript React Function Component",
        dscr = "Typescript React Function Component",
      }, {
        luasnip.text_node({ "import { FC } from 'react'", "", "interface " }),
        luasnip.function_node(filename_without_ext, {}),
        luasnip.text_node({ "Props {", "  " }),
        luasnip.insert_node(1),
        luasnip.text_node({ "", "}", "", "const " }),
        luasnip.function_node(filename_without_ext, {}),
        luasnip.text_node({ ": FC<" }),
        luasnip.function_node(filename_without_ext, {}),
        luasnip.text_node({ "Props> = ({ " }),
        luasnip.insert_node(2),
        luasnip.text_node({ " }) => {", "  return <div>" }),
        luasnip.function_node(filename_without_ext, {}),
        luasnip.text_node({ "</div>", "}", "", "export default " }),
        luasnip.function_node(filename_without_ext, {}),
      }),
    })
    --- end of change

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip").filetype_extend("javascriptreact", { "html" })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip", keyworld_length = 2 }, -- snippets
        { name = "friendly-snippets" }, -- snippets
        { name = "buffer", keyword_length = 3 }, -- text within current buffer
        { name = "path" }, -- file system paths
        { name = "tailwindcss" }, -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
