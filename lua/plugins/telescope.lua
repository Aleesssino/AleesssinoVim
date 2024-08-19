return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },

  config = {
    defaults = {
      layout_config = {
        horizontal = {
          preview_cutoff = 0,
        },
      },
    },
  },
}
