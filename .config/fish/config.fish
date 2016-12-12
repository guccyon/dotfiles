set -x EDITOR vi
set -x SHELL /usr/local/bin/fish
set -x LESS -R

eval (direnv hook fish)
eval (docker-machine env)

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
  bind \c] peco_change_directory # Bind for prco change directory to Ctrl+]
end

function cd
  builtin cd $argv
  ls -la
end

balias rm 'rmtrash'
balias be 'bundle exec'
balias diff 'colordiff'
balias dl 'docker ps -l -q'
balias dps 'docker ps --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.RunningFor}}"'
balias dexec 'docker exec -it (dps | peco | cut -f 1) bash'
balias drun 'docker run --rm -it'
balias mux 'tmuxinator'
