#!/usr/bin/env bats

@test "Bats should work alone" {
  run
  [[ $status = 0 ]]
}

@test "Bats should work with bc" {
  result="$(echo 2 + 2 | bc)"
  [ "$result" -eq 4 ]
}

@test "Bats should work with a simple loaded function" {
  load ./bin/add
  # currently loading it and running at same time
  # echo "# result: $result" >&3
  [ "$result" = 5 ]
}
