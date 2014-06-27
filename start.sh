#!/usr/bin/env bash
set -e

#docker kill go-server || docker rm go-server &> /dev/null
docker run -d --link go-server:go-server patforna/go-agent
