#!/usr/bin/env bash
set -e

wait-for-it.sh \
    -h ${POSTGRES_HOSTNAME:-db} \
    -p ${POSTGRES_PORT:-5432} \
    -t 15 \
    -- echo 'database available'

echo 'database setup'
mix ecto.create && mix ecto.migrate || true

echo 'app available'
exec sleep infinity
