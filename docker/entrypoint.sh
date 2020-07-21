#!/bin/sh

# Configuring application permissions
mkdir -p ./var/log && chmod -Rf 777 ./var/log
mkdir -p ./var/cache && chmod -Rf 777 ./var/cache

# Running composer and cleanup cache.
php /usr/local/bin/composer i -o --prefer-dist --no-progress
php bin/console cache:clear

# Starting local server and dumper.
php bin/console server:start 0.0.0.0:8081 &
php bin/console server:dump
