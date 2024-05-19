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

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },
}
