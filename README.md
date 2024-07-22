<div align="center">
  <h3>This configuration is tailored to provide an optimized development environment for coding full-stack applications in TypeScript (**Next.js**, React, etc.) and for low-level programming in C, Go and Rust.
  </h3>    
</div>

  <hr>

<div align="center"><p>
  <img alt="Logo" src="https://github.com/Aleesssino/AleesssinoVim/assets/97041873/8badc080-c510-4104-bb12-3701a44a6655" />
</div>

  <hr>
<details><summary>In Action</summary>
  
<div align="center">
  <img alt="action" src="https://github.com/Aleesssino/AleesssinoVim/assets/97041873/312a8223-1deb-463a-a8d8-610039a8d04e" />
</div>

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

  
  Refer to the comments in the files on how to customize **AleesssinoVim** & **https://www.lazyvim.org/**.
  </hr>
  Make it yours!

</details>
