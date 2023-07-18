# Checkmate

## Description

A theme for the ZSH shell that its decorated by chess symbols.

![](images/preview.png)

> **Note**
>
> The theme may look different in your setup as its appearance depends of what
> colors and font you are using for your terminal emulator. Use the preview as
> just a reference.
>
> Theme used for terminal emulator is [Flamerial](https://github.com/skippyr/flamerial).

Here is the description of its design:
-	A decorator will tell your user privileges: it will be a pawn if you are a
	normal user and a queen, if you are `root`.
-	If your last command failed, its exit code will appear inside parenthesis. For
	example: `[130]`.
-	Virtual environments that you have sourced will appear inside angle brackets.
	For example: `<venv>`.
-	Your current directory will appear abbreviated: for parent directories, only
	their initials will be used.
-	If inside a Git repository, the current branch will appear inside
	parenthesis and prefixed by `git:`. If there are changes to be commited, it
	will use `*`. For example: `git:(main*)`.

## Installation

### Dependencies

The following dependencies must be installed to run this software:

| Dependency | Description |
|-|-|
| `git` | Required to retrive information about Git repositories. |
| A [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases)' font | Provides the required pretty symbols. |

### Manual Procedures

Use the following instructions to install this theme manually.

-	Run the following command inside of a terminal emulator to install the theme.
```bash
git clone --depth=1 https://github.com/skippyr/checkmate\
                    ~/.local/share/zsh/themes/checkmate &&
echo "source ~/.local/share/zsh/themes/checkmate/checkmate.zsh-theme" >> ~/.zshrc
```

-	Reopen the terminal emulator to load the theme.

### Procedures With OhMyZSH

Use the following instructions to install this theme for OhMyZSH.

-	Run the following command inside of a terminal emulator to install the theme.

```bash
git clone --depth=1 https://github.com/skippyr/checkmate\
                    ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/checkmate
```

-	Change the value of the `ZSH_THEME` variable in your ZSH configuration file,
	`~/.zshrc`, to use the theme:

```bash
ZSH_THEME=checkmate/checkmate
```

-	Reopen your terminal emulator to load the theme.

## Support

Report issues, questions and suggestion through the [issues tab](https://github.com/skippyr/checkmate).

## Copyright

This software is distributed under the MIT License. A copy of the license is
bundled with the source code.

Copyright (c) 2023, Sherman Rofeman. MIT license.
