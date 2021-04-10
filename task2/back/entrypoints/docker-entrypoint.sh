#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
# bundle exec rails db:create
# bundle exec rails db:migrate
# bundle exec rails assets:precompile
bundle exec rails s -b 0.0.0.0