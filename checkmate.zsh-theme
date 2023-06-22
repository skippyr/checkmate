# Enables prompt substitution.
#
# This makes ZSH substitute variables and functions inside of the PROMPT
# variables. For it to work, they must be defined using single quotes.
setopt promptsubst
# Disables the default changes made to the prompt when sourcing a virtual
# environment.
export VIRTUAL_ENV_DISABLE_PROMPT="1"

# Prints the name of sourced virtual environments.
function _checkmate::print_venv {
  typeset -r venv=${VIRTUAL_ENV##*/}
  [[ -n ${venv} ]] &&
  echo "<%F{magenta}${venv}%f> "
}

# Prints the current directory path abbreviating the name of parent directories.
function _checkmate::print_pwd {
  typeset pwd=("${(s./.)PWD/${HOME}/~}")
  [[ ${#pwd} > 1 ]] &&
  for splits_iterator in {1..$((${#pwd} - 1))}; do
    [[ "${pwd[splits_iterator]}" == .* ]] &&
    pwd[splits_iterator]=${pwd[splits_iterator][1,2]} ||
    pwd[splits_iterator]=${pwd[splits_iterator][1]}
  done
  echo ${(j./.)pwd}
}

# If inside a Git repository, it prints a decorator whenever there are changes
# to be commited.
function _checkmate::print_git_changes {
  [[ $(git status --porcelain 2>/dev/null) ]] &&
  echo "*"
}

# If inside a Git repository, it prints the name of the branch and if there are
# changes to be commited.
function _checkmate::print_git_info {
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] &&
  echo " %F{yellow}git:(%F{red}${branch}$(_checkmate::print_git_changes)%F{yellow})%f"
}

PROMPT='%F{blue}%f %(?..[%F{red}%?%f] )%(#.%F{red}.) $(_checkmate::print_venv)%F{blue}$(_checkmate::print_pwd)%f$(_checkmate::print_git_info) ↪  '
