local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Copy Images and add then to public/images/ directory
local function move_image_to_public_images()
  -- Prompt user for the full path of the image file
  local src_path = vim.fn.input("Enter full path of image file: ")

  -- Define destination directory and file path
  local dest_dir = vim.fn.expand("public/images")
  local file_name = vim.fn.fnamemodify(src_path, ":t") -- Extract file name from path
  local dest_path = dest_dir .. "/" .. file_name

  -- Print paths for debugging
  print("Source Path: " .. src_path)
  print("Destination Path: " .. dest_path)

  -- Check if the source file exists
  if vim.fn.filereadable(src_path) == 1 then
    -- Check if the destination directory exists, create if not
    if vim.fn.isdirectory(dest_dir) == 0 then
      local create_dir_command = "mkdir -p " .. vim.fn.shellescape(dest_dir)
      local dir_creation_output = vim.fn.system(create_dir_command)
      if vim.v.shell_error ~= 0 then
        print("Failed to create destination directory. Output: " .. dir_creation_output)
        return
      end
    end

    -- Construct the copy command
    local command = "cp " .. vim.fn.shellescape(src_path) .. " " .. vim.fn.shellescape(dest_path)

    -- Execute the command and capture output and error messages
    local output = vim.fn.system(command)
    local success = vim.v.shell_error == 0

    if success then
      print("File copied successfully!")
    else
      print("Failed to copy the file. Output: " .. output)
    end
  else
    print("Source file does not exist.")
  end
end

-- Create a Vim command to run the function
vim.api.nvim_create_user_command("MoveImage", move_image_to_public_images, {})
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = { colorscheme = "solarized-osaka" },
    },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },

  install = { colorscheme = { "solarized-osaka" } },

  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
