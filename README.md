<div align="center">
  <h3>This configuration is tailored to provide an optimized development environment for coding full-stack applications in TypeScript (Next.js, React, etc.) and for low-level programming in C, Go and Rust.
  </h3>    
</div>


  <hr>
<details><summary>In Action</summary>

  <hr>

https://github.com/Aleesssino/AleesssinoVim/assets/97041873/095f9f0c-55f0-4dbd-8df1-f92c75431bdb
</details>

  <hr>




## ✨ Features

- 🚀 Blazingly fast
- 🔥 LazyVim based full-fledged IDE
- 💤 Easily customize and extend your config with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🀄 Menu, autocmds, snippets and keymaps.. everything configured for rapid development
- 📦 Comes with a wealth of plugins pre-configured and ready to use

## ⚡️ Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- You can use this [**script**](https://github.com/Aleesssino/scripts/tree/9bd4c6ea623d15dc7611df21cd8f233d0ac8e6ad/Neovim-setup-for-Lazy)
  
## 🚀 Getting Started


<details><summary>Installation</summary>

- Make a backup of your current Neovim files:

  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  ```

- Clone this repository

  ```sh
  git clone git@github.com:Aleesssino/AleesssinoVim.git ~/.config/nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim!

  ```sh
  nvim
  ```

- You can optionally add an alias to your .bashrc file to use nvim as the default editor when you type vi.

  open .bashrc file:
  ```sh
  vi ~/.bashrc
  ```
  Add the following line to the end of the file:
  ```sh
  alias vi="nvim"
  ```

  Applly the changes:
  ```sh
  source ~/.bashrc
  ```
- Start Neovim!
  ```sh
  vi
  ```

  
  Refer to the comments in the files on how to customize **AleesssinoVim** & [**https://www.lazyvim.org/**](https://www.lazyvim.org/).
  </hr>
  Make it yours!

</details>

For a better understanding of the main concepts behind this Neovim configuration, check out [**TJ's video**](https://youtu.be/m8C0Cq9Uv9o?si=dEQT3MJPPej9DtUp) — it provides a clear explanation of what's going on.


