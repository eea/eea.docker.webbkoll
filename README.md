# eea.docker.webbkoll

Dockerized [Webbkoll](https://codeberg.org/dataskydd.net/webbkoll) — a privacy-focused web analytics tool.

## Upstream

| Component | Upstream | EEA Fork |
|-----------|----------|----------|
| webbkoll (frontend) | https://codeberg.org/dataskydd.net/webbkoll | — |
| webbkoll-backend | https://codeberg.org/dataskydd.net/webbkoll-backend | https://github.com/eea/webbkoll-backend |

## Important

Always upgrade both webbkoll and webbkoll-backend together — backward-incompatible changes may exist between them.

## Configuration

The entrypoint script (`docker-entrypoint.sh`) applies the following at container startup:

| Setting | Source file | Default |
|---------|-------------|---------|
| `BACKEND_HOST` / `BACKEND_PORT` | `config/config.exs` | `http://localhost:8100/` |
| `rate_limit_host` | `config/prod.exs` | 1000 |
| `rate_limit_client` | `config/prod.exs` | 1000 |
| `SECRET_KEY_BASE` | generated at runtime | `mix phx.gen.secret` |

## Features

- **Elixir 1.16** base image
- **Shallow clone** (`--depth 1`) from upstream — minimal image size
- **Runtime secret generation** — `SECRET_KEY_BASE` generated via `mix phx.gen.secret` at container startup, never baked into the image
- **Rate limits** set to 1000 for host and client (suitable for local/proxied deployments)
- **Backend URL** configurable via `BACKEND_HOST` and `BACKEND_PORT` environment variables
