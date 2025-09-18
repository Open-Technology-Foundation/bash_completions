#!/bin/bash
set -euo pipefail

declare -a cmds=(
  'openai --help'
  'openai api --help'
  'openai tools --help'
  'openai migrate --help'
  'openai grit --help'
)

declare -- cmd
echo "# OPENAI"
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
