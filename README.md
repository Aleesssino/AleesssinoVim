<div align="center">
  <h3>This configuration is tailored to provide an optimized development environment for coding full-stack applications in TypeScript (Next.js, React, etc.) and for low-level programming in C, Go, Rust, and other languages.
  </h3>    
</div>

  <hr>

<div align="center"><p>
  <img alt="Logo" src="https://github.com/Aleesssino/AleesssinoVim/assets/97041873/8badc080-c510-4104-bb12-3701a44a6655" />
</div>

  <hr>

<div align="center">
  <img alt="action" src="https://github.com/Aleesssino/AleesssinoVim/assets/97041873/312a8223-1deb-463a-a8d8-610039a8d04e" />
</div>

  <hr>

<div align="center"> 
  <img alt="types" src="https://github.com/Aleesssino/AleesssinoVim/assets/97041873/82c08cda-eeb8-4c01-be80-7abcf1e4307c" />
</div>

  <hr>

<div align> 
  <img alt="not transparent bg" src="https://github.com/Aleesssino/AleesssinoVim/assets/97041873/492b2656-4b14-4641-8096-7bf2f641ae50"/>
</div>


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
