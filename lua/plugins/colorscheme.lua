return {
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "osaka",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim]
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },
}
