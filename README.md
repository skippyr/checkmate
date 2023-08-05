# Checkmate
## About
A theme for the ZSH shell that is decorated by chess pieces.
![](preview.png)

It can show you:
-	The exit code of failed commands.
-	If you are the root user or a normal user using chess pieces.
-	Your current directory abbreaviating parent directories.
-	If inside a Git repository, the branch and if there are changes to commit.

## Installation
### Dependencies
-	git
-	A Nerd Font's font.

### Procedures
-	Clone this repository.
```bash
git\
	clone --depth=1 https://github.com/skippyr/checkmate\
	~/.local/share/zsh/themes/checkmate
	```

-	Add the following source rule to your `~/.zshrc` file. Ensure to not source
other theme.

```bash
source ~/.local/share/zsh/themes/checkmate/checkmate.zsh-theme
```

-	Reopen ZSH.

## Copyright
This software is under the MIT license. A copy of the license is bundled with the source code.
