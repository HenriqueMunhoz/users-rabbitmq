function app_env {
    local envs=$(env | egrep '^BIFROST_' | sed 's/^/ -e /')
    local rails_env=$( [[ -n "${RAILS_ENV}" ]] && printf " -e RAILS_ENV=${RAILS_ENV}" )
    printf "%s " "$envs $rails_env" | xargs printf " %s"
}

export WORKDIR="$(dirname "${BASH_SOURCE[0]}")/.."
export DOCKER_COMPOSE="docker-compose -f $WORKDIR/docker-compose.yml"
