function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function git_names {
  local     USER_COLOR="\[\033[01;36m\]"
  local   BRANCH_COLOR="\[\033[01;31m\]"
  local      LIGHT_RED="\[\033[1;31m\]"
  local          GREEN="\[\033[01;32m\]"
  local    LIGHT_GREEN="\[\033[1;32m\]"
  local          WHITE="\[\033[01;0m\]"
  local     LIGHT_GRAY="\[\033[0;37m\]"
  local       AT_COLOR="\[\033[01;33m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

# PS1="${TITLEBAR}\ # optional - change tab names
PS1="$USER_COLOR\u$AT_COLOR@$GREEN\h:\[\033[34;1m\]\w\[\033[m\]$BRANCH_COLOR\$(parse_git_branch)\
$WHITE\$ "
PS2='> '
PS4='+ '
}


git_names;
