function dropbox_remove_conflict() {
  find ~/Dropbox/ -name "*conflict*" -exec rm {} \;
}

function ls_abbrev() {
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-CF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='ls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}



function do_enter() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi
  echo
  ls
  # ls_abbrev
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
      echo
      echo -e "\e[0;33m--- git status ---\e[0m"
      git status -sb
  fi
  zle reset-prompt
  return 0
}
zle -N do_enter

function xcode () {
    if ls *.xcworkspace > /dev/null 2>&1
    then
        find . -maxdepth 1 -name '*.xcworkspace' -exec open '{}' \;
    elif ls *.xcodeproj > /dev/null 2>&1
    then
        find . -maxdepth 1 -name '*.xcodeproj' -exec open '{}' \;
    fi
}
