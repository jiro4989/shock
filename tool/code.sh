#!/bin/bash

for i in {101..172}; do
  key="$(eval echo "\$'\\$i'")"
  cat << E
"$key": @[
  Convert(tags: @[tagQuoting], val: "\$'\\\\$i'"),
],
E
done
