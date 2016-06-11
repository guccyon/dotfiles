function rails-new() {
  docker run -it --rm -v `pwd`:/usr/local/src -w /usr/local/src rails rails new $@ --skip-bundle
}

function rails-api-new() {
  git clone git@bitbucket.org:thiguchi/rails_api_template.git $1
  cd $1
  docker run -it --rm -v `pwd`:/usr/local/src -w /usr/local/src rails rails new . --force -m app_template.rb --skip-test-unit
}

function rails-container() {
  name=$1
  if [ $# -ne 1 ]; then
    echo '$contaigner-name must be required!'
    name=$(basename `pwd`)
  fi
  docker run -it -p 3000:3000 -v `pwd`:/var/app -w /var/app --name $name tetsu/rails /bin/bash
}

function dcrun() {
  before=$(docker volume ls -q)
  docker-compose run --rm $@
  after=$(docker volume ls -q)
  targets=$(echo $before $after | tr ' ' '\n' | sort | uniq -u)
  docker volume rm $(echo $targets) 1>/dev/null 2>/dev/null
}
