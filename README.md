# Checkmate

## Starting Point

The Checkmate project is a one-line ZSH theme that uses chess pieces as
decoration.

This theme can be setup with a series of terminal emulators, themes and
wallpapers. You can use following preview as a source of inspiration and
reference to see what it can look like:

![](./images/preview.png)

> In this preview, the Checkmate theme was used within the [Kitty terminal emulator](https://github.com/kovidgoyal/kitty)
with the [Flamerial theme](https://github.com/skippyr/flamerial). Font used is
Mononoki Nerd Font. Wallpaper is [White, black, and brown chess board game by Charlie Solorzano](https://unsplash.com/photos/aeXK1IeVVoI)
from Unsplash.

## Features

This theme can show you the following information:

* The exit code of failed commands
* The name of sourced virtual environments.
* Your current directory path abbreviated.
* If inside a Git repository, the name of the branch and if it has changes to be
  commit.

## Dependencies

This theme has some dependencies that you need to download before installing it.

* git

    This is the terminal utility used to obtain information about your Git
    repositories.

* A font patched by the Nerd Fonts project.

    This font provides all pretty symbols used in this theme.

## Installation

You can install this theme in multiple ways, use the one that suits you best.

### Manually

* Run the following command to install the theme at
  `~/.local/share/zsh/themes/chinatown`.

    ```bash
    git clone --depth=1 https://github.com/skippyr/checkmate ~/.local/share/zsh/themes/checkmate &&
    echo "source \"${HOME}/.local/share/zsh/themes/checkmate/checkmate.zsh-theme\"" >> ~/.zshrc
    ```

* Reopen your terminal emulator.

### Within OhMyZSH

* Install the theme in OhMyZSH custom themes' directory.

    ```bash
    git clone --depth=1 https://github.com/skippyr/checkmate ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/checkmate
    ```

* Change the value of the `ZSH_THEME` variable in your ZSH configuration file,
  `~/.zshrc`, to use the theme.

    ```bash
    ZSH_THEME="checkmate/checkmate"
    ```

* Reopen your terminal emulator.

## Issues And Contributions

Learn how to report issues and contribute to this project by reading its
[contributions guidelines](https://skippyr.github.io/materials/pages/contributions_guidelines.html).

## License

This project is released under the terms of the MIT license. A copy of the
license is bundled with the source code.

Copyright (c) 2023, Sherman Rofeman. MIT license.
