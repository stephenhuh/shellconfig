#!/usr/bin/env bash -e

function add() {
  echo "running add"
  local a=2
  local b=3
  result=$((a+b))
}

add
