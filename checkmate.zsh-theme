# Enables ZSH prompt substitution.
#
# This make it substitute variables and functions in the prompt variables, but
# they need to be defined using single quotes for it to work.
setopt promptsubst
# Prevents the default changes made to the prompt when sourcing a virtual
# environment.
export VIRTUAL_ENV_DISABLE_PROMPT="1"

# To avoid conflicts with possible user defined functions, all functions defined
# in this theme use the "checkmate::" prefix.
#
# They might also use an underline character (_) at their start to make them
# harder to find when using a regular tab completition.

# If using a virtual environment, prints its base name.
function _checkmate::print_venv {
  typeset -r venv=${VIRTUAL_ENV##*/}
  [[ -n ${venv} ]] &&
  echo "<%F{magenta}${venv}%f> "
}

# Prints the current directory path (PWD) with the name of parent directories
# abbreviated. A tilde character (~) substitutes the ${HOME} directory.
function _checkmate::print_pwd_abbreviated {
  typeset -a pwd=("${(s./.)PWD/${HOME}/~}")
  [[ ${#pwd} > 1 ]] &&
  for splits_iterator in {1..$((${#pwd} - 1))}; do
    [[ "${pwd[splits_iterator]}" == .* ]] &&
    pwd[splits_iterator]="${pwd[splits_iterator][1,2]}" ||
    pwd[splits_iterator]="${pwd[splits_iterator][1]}"
  done
  echo "${(j./.)pwd}"
}

# If inside a Git repository, prints a decorator if there are changes to be
# commited.
function _checkmate::print_git_changes {
  [[ $(git status --porcelain 2>/dev/null) ]] &&
  echo "*"
}

# If inside a Git repository, prints the name of the branch and if there are
# changes to be commited.
function _checkmate::print_git_info {
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] &&
  echo " %F{yellow}git:(%F{red}${branch}$(_checkmate::print_git_changes)%F{yellow})%f"
}

PROMPT='%F{blue}%f %(?..[%F{red}%?%f] )%(#.%F{red}.) $(_checkmate::print_venv)%F{blue}$(_checkmate::print_pwd_abbreviated)%f$(_checkmate::print_git_info) ↪  '
