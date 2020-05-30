#!/bin/sh

. ./.env
./build.sh $USER $TOKEN
git add .
git commit -m "Auto-update $(date '+%m/%e/%Y at %H:%M:%S')"
git push origin master
