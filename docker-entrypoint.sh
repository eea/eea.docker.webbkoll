#!/bin/sh
set -e

export MIX_ENV=prod

export SECRET_KEY_BASE=$(mix phx.gen.secret)

sed -i 's/localhost:8100/'"$BACKEND_HOST"':'"$BACKEND_PORT"'/' /webbkoll/config/config.exs
sed -i 's#rate_limit_host: %{"scale" => 60_000, "limit" => .*},#rate_limit_host: %{"scale" => 60_000, "limit" => 1000},#' /webbkoll/config/config.exs
sed -i 's#rate_limit_client: %{"scale" => 60_000, "limit" => .*},#rate_limit_client: %{"scale" => 60_000, "limit" => 1000},#' /webbkoll/config/config.exs 

MIX_ENV=prod PORT=4000 mix phx.server
