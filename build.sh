#!/bin/bash

VERSION=$1
docker build -t pandabear41/jellyfin-clean-transcodes:latest -t pandabear41/jellyfin-clean-transcodes:$VERSION .
docker push pandabear41/jellyfin-clean-transcodes:$VERSION
docker push pandabear41/jellyfin-clean-transcodes:latest
