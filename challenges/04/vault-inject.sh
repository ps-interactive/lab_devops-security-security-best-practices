#!/bin/bash
export DB_USER=$(vault kv get -field=username secrets/database)
export DB_PASSWORD=$(vault kv get -field=password secrets/database)
exec "$@" #execute the command passed to the script.
