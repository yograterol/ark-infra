#!/usr/bin/env bash


if [ "$DB_HOST" != 'localhost' ]; then
  sed -i -e 's/localhost/'$DB_HOST'/g' config.mainnet.json
fi

if [ "$DB_USER" != 'root' ]; then
  sed -i -e 's/"user": null,/"user": "'$DB_USER'",/g' config.mainnet.json
fi

if [ "$DB_PASSWORD" != 'password' ]; then
  sed -i -e 's/"password",/"'$DB_PASSWORD'","/g' config.mainnet.json
fi

exec "$@"
