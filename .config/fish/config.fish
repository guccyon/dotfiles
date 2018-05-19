set -x EDITOR vi
set -x SHELL /usr/local/bin/fish
set -x LESS -R
set -U fish_user_paths (npm bin -g) $fish_user_paths

eval (direnv hook fish)

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
balias dc 'docker-compose'
balias dcrun 'docker-compose run --rm'
balias dcr-rails 'dcrun rails'
balias mux 'tmuxinator'
balias gitgc 'git remote prune origin; git gc'
set -g fish_user_paths (npm bin -g) $fish_user_paths
