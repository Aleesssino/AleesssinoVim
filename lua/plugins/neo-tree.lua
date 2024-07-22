return {
  "nvim-neo-tree/neo-tree.nvim",

  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab

      window = { width = 25 },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {
            ".git",
          },
        },
      },
    })
  end,
}
