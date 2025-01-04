return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
            ⠀⠀⠀⠀⣾⣄⣸⣌⣇⣈⣦⣝⣆⠀⠀⠀⠀⠀⠹⢧⠘⣆⠀⡇⠀⠠⠊⢀⣀⣀⣀⣠⣶⣐⣲⣶⣿⣤⠙⣾⣿⣷⣾⠒⡆⠀⠀⠀⠀⠀
            ⠀⠀⢠⠀⣿⡆⡄⠘⢿⣄⠀⠈⠙⠳⣄⠀⠀⠀⠀⢀⢧⢸⢦⣰⠀⠀⠊⠁⣶⣾⣿⣿⠿⠿⣿⡿⠿⠿⣿⠏⠀⠀⡏⢀⡇⡼⠀⠀⠀⠀
            ⠀⠀⠈⡇⢹⢠⠀⠀⠀⠻⣟⠂⠀⠀⠈⠢⡀⠀⠀⠈⢮⣿⠀⠙⢣⠀⠀⠔⠛⣿⣿⡟⢋⣹⠟⠀⠀⠀⠃⠀⠀⢠⠃⣼⠞⠁⠀⠀⠀⠀
            ⠀⠀⠀⢳⢸⣿⢰⣶⣷⣶⣾⣷⣾⣶⣤⡀⠈⢣⡀⠀⠀⠙⣷⡀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⡼⣼⠃⠀⠀⠀⡄⠀⠀
            ⠀⠀⠀⣈⣮⣿⣿⣿⠟⠛⢻⣿⣿⣿⣭⣽⠷⠄⢱⣖⢄⡀⠘⡟⠢⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⢠⡿⡏⠀⠀⠀⠘⠀⠀⠀
            ⠀⠀⢠⠀⠘⣿⣿⣿⣆⠀⠀⠉⠓⠒⠛⠋⠀⠀⠀⢿⠀⠈⠓⢼⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⢀⠇⠀⠀⣼⠀⠀⠀⠀
            ⢠⠀⠀⢳⡄⠈⢻⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⢀⠀⠸⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⡸⠀⢀⡾⠃⠀⠀⣰⠃
            ⠃⠀⠀⢸⠈⠳⢄⣹⣿⣿⡀⠀⠀⠀⠀⠀⢀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⢠⠃⣠⠊⠀⠀⠀⠀⠁⠀
         █████╗ ██╗     ███████╗███████╗███████╗███████╗███████╗██╗███╗   ██╗ ██████╗ 
        ██╔══██╗██║     ██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝██║████╗  ██║██╔═══██╗
        ███████║██║     █████╗  █████╗  ███████╗███████╗███████╗██║██╔██╗ ██║██║   ██║
        ██╔══██║██║     ██╔══╝  ██╔══╝  ╚════██║╚════██║╚════██║██║██║╚██╗██║██║   ██║
        ██║  ██║███████╗███████╗███████╗███████║███████║███████║██║██║ ╚████║╚██████╔╝
        ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
     ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },

  --supress "No information available bar"
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },

  -- Neovim plugin to improve the default vim.ui interfaces
  {
    "stevearc/dressing.nvim",
    event = "BufEnter",
    config = function()
      require("dressing").setup({
        input = {
          win_options = {
            winblend = 0,
          },
        },
      })
    end,
  },

  -- lualine.lua
  -- Custom status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      -- Custom Lualine component to show attached language server
      local clients_lsp = function()
        local bufnr = vim.api.nvim_get_current_buf()

        local clients = vim.lsp.buf_get_clients(bufnr) -- Don't change, breaks the function
        if next(clients) == nil then
          return ""
        end

        local c = {}
        for _, client in pairs(clients) do
          table.insert(c, client.name)
        end
        return " " .. table.concat(c, "&")
      end

      -- Custom component to show macro recording status
      local macro_recording = function()
        local recording_register = vim.fn.reg_recording()
        if recording_register ~= "" then
          return " Recording @" .. recording_register -- Show the register being recorded
        end
        return "" -- Empty string when not recording
      end

      local custom_osaka = require("lualine.themes.auto")

      -- Custom colours
      custom_osaka.normal.b.fg = "#cad3f5"
      custom_osaka.insert.b.fg = "#cad3f5"
      custom_osaka.visual.b.fg = "#cad3f5"
      custom_osaka.replace.b.fg = "#cad3f5"
      custom_osaka.command.b.fg = "#cad3f5"
      custom_osaka.inactive.b.fg = "#cad3f5"
      custom_osaka.normal.c.fg = "#6e738d"
      custom_osaka.normal.c.bg = "NONE"

      require("lualine").setup({
        options = {
          theme = custom_osaka,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "", right = "" }, icon = "" },
          },
          lualine_b = {
            {
              "filetype",
              icon_only = true,
              padding = { left = 1, right = 0 },
            },
            "filename",
          },
          lualine_c = {
            {
              "branch",
              icon = "",
            },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              colored = false,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = "" },
              update_in_insert = true,
            },
          },
          lualine_y = {
            clients_lsp,
            {
              macro_recording,
              color = { fg = "#FFA500" }, -- Apply orange color here
            },
          },
          lualine_z = {
            { "location", separator = { left = "", right = "" }, icon = "" },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        extensions = { "toggleterm", "trouble" },
      })
    end,
  },
}
