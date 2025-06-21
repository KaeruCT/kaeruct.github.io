#!/bin/sh
# Copyright (c) 2025 Andrés Villarreal  
# Licensed under MIT License - see LICENSE file for details

FILES="3d beings checker cityscape dance dots earthbound fireworks grid lel lines p2 rainbow-sprinkler2 random-blocks starfield tap tunnel turtle tyc vs"

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

export SCRIPT_DIR

run_anim_thumb() {
  "$SCRIPT_DIR/anim_thumb.sh" "https://kaeru.neritic.net/projects/short-experiments/$1" "$1.webm"
}

export -f run_anim_thumb

echo "$FILES" | xargs -n 1 -P 5 -I {} sh -c 'run_anim_thumb "$@"' _ {}
