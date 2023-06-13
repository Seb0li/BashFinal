#!/bin/bash

data=$(cat laptopsintel.html)

i=1

while read -r line; do
  model=$(echo "$line" | sed -n 's/.*title="\([^"]*\)".*/\1/p')
  description=$(echo "$line" | sed -n 's/.*<p class="description">\([^<]*\)<\/p>.*/\1/p')
  price=$(echo "$line" | sed -n 's/.*<h4 class="pull-right price">\([^<]*\)<\/h4>.*/\1/p')

  # Enlever lignes vides
  if [[ -n "$model" || -n "$description" || -n "$price" ]]; then
    echo "$model | $description | $price"
  fi

  ((i++))
done <<< "$data"
