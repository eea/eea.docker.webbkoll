#!/bin/sh
set -e

sed -i 's/localhost:8100/'"$BACKEND_HOST"':'"$BACKEND_PORT"'/' /webbkoll/config/prod.exs
sed -i 's#rate_limit_host: %{"scale" => 60_000, "limit" => .*},#rate_limit_host: %{"scale" => 60_000, "limit" => 1000},#' /webbkoll/config/prod.exs
sed -i 's#rate_limit_client: %{"scale" => 60_000, "limit" => .*},#rate_limit_client: %{"scale" => 60_000, "limit" => 1000},#' /webbkoll/config/prod.exs

MIX_ENV=prod PORT=4000 mix phx.server
