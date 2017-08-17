# function dcrun
#   set before (docker volume ls -q)
#   docker-compose run --rm $@
#   set after (docker volume ls -q)
#   set targets (echo $before $after | tr ' ' '\n' | sort | uniq -u)
#   docker volume rm (echo $targets) 1>/dev/null 2>/dev/null
# end
