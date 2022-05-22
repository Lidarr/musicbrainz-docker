#!/bin/bash

set -e -u

dockerize -wait "tcp://${MUSICBRAINZ_POSTGRES_SERVER}:5432" -timeout 60s sleep 0

while true
do
    # Sleep first to make sure everything is up before starting replication
    sleep 10m

    carton exec -- /musicbrainz-server/admin/cron/mirror.sh
done
