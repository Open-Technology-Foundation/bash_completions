#!/bin/bash
set -euo pipefail

declare -a cmds=(
  'ollama --help'
  'ollama  serve     --help'
  'ollama  create    --help'
  'ollama  show      --help'
  'ollama  run       --help'
  'ollama  stop      --help'
  'ollama  pull      --help'
  'ollama  push      --help'
  'ollama  list      --help'
  'ollama  ps        --help'
  'ollama  cp        --help'
  'ollama  rm        --help'
  'ollama  help      --help'
  'ollama list'
  'ollama list |sort |cut -d " " -f1| grep -v NAME'
  'ollama ps'
)

declare -- cmd
echo "# OLLAMA"
echo
for cmd in "${cmds[@]}"; do
  echo "## $cmd"
  echo
  eval "$cmd"
  echo
  echo '---'
  echo
done


#fin
