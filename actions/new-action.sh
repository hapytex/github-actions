#!/bin/bash

name=$(echo "$@")

# source: https://gist.github.com/oneohthree/f528c7ae1e701ad990e6
slug=$(iconv -t ascii//TRANSLIT <<<"$name" | sed -r 's/[^a-zA-Z0-9]+/-/g' | sed -r 's/^-+\|-+$/-/g' | tr A-Z a-z)

fn="$slug/action.yml"

mkdir -p "$slug"
printf "$(< action.yml.template)" "$name" > "$fn"
editor "$fn"
git add "$fn"
git commit -am "Add an action for $name"
