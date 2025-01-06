#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
# Se você estiver usando um tipo de instância Free, você precisa
# realizar migrações de banco de dados no comando de construção.
# Remova o comentário da seguinte linha:
bundle exec rails db:migrate
