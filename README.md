# Checkmate
## About
This repository contains the source code of Checkmate, a theme for the ZSH shell that is decorated by chess pieces.

![](preview.webp)

Note: this theme uses your terminal emulator's colors, so they may look different in your setup.

In the prompt, you will find:

- If you are the root user, as the the pawn will become a queen.
- The exit code of failed commands.
- If you have sourced a virtual environment, its base name.
- Your current directory with parent directories abbreviated by their initials.
- If inside a Git repository, the active branch and if it is dirty.

# Installation
### Dependencies
The following dependencies must be installed to install and run this theme.

- `ZSH`: this is the shell this theme applies on.
- `git`: it will be used to both clone this repository and to get info about your repositories to show in the prompt.
- [A Nerd Font's font](https://www.nerdfonts.com/font-downloads): it provides the pretty symbols used in the theme.

### Procedures
Using a terminal emulator, follow these steps:

- Clone this repository using `git`.

```bash
git clone --depth 1 https://github.com/skippyr/checkmate\
~/.local/share/zsh/themes/checkmate
```

- Add the following source command to your `~/.zshrc` file. Ensure to not source any other theme to avoid conflicts.

```bash
source ~/.local/share/zsh/themes/checkmate/checkmate.zsh-theme
```

- Open a new ZSH session. The theme should now be applied.

## Support
Report issues, questions and suggestions through its [issues page](https://github.com/skippyr/checkmate/issues).

## Copyright
This software is under the MIT license. A copy of the license is bundled with the source code.
