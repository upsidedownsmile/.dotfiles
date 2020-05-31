#!/bin/bash
if [ -d $1 ]; then
  for i in $1*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
