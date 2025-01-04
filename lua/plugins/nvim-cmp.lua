return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "R-nvim/cmp-r",
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },

  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")

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
      luasnip.snippet({
        trig = "fca",
        namr = "Async Function Component",
        dscr = "Typescript React Async Function Component",
      }, {
        luasnip.text_node({
          "export default async function Page() {",
          '  return <div className="text-center pt-32 px-5"></div>;',
          "}",
        }),
      }),
    })

    --Snippet for arrow functions
    luasnip.add_snippets("javascript", {
      luasnip.snippet("aw", {
        luasnip.text_node("const "),
        luasnip.insert_node(1, "name"),
        luasnip.text_node(" = ("),
        luasnip.insert_node(2, "param"),
        luasnip.text_node(") => { "),
        luasnip.insert_node(3, "body"),
        luasnip.text_node(" };"),
      }),
    })

    luasnip.add_snippets("typescript", {
      luasnip.snippet("aw", {
        luasnip.text_node("const "),
        luasnip.insert_node(1, "name"),
        luasnip.text_node(": "),
        luasnip.insert_node(2, "type"),
        luasnip.text_node(" = ("),
        luasnip.insert_node(3, "param"),
        luasnip.text_node(") => { "),
        luasnip.insert_node(4, "body"),
        luasnip.text_node(" };"),
      }),
    })

    luasnip.add_snippets("typescriptreact", {
      luasnip.snippet("aw", {
        luasnip.text_node("const "),
        luasnip.insert_node(1, "name"),
        luasnip.text_node(": "),
        luasnip.insert_node(2, "type"),
        luasnip.text_node(" = ("),
        luasnip.insert_node(3, "param"),
        luasnip.text_node(") => { "),
        luasnip.insert_node(4, "body"),
        luasnip.text_node(" };"),
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
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "luasnip", keyworld_length = 2 }, -- snippets
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "nvim_lsp_signature_help" },
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
