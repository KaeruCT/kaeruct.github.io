#!/bin/sh
# Copyright (c) 2025 Andrés Villarreal
# Licensed under MIT License - see LICENSE file for details

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <url> <output_file>"
  exit 1
fi

URL="$1"
OUTPUT_FILE="$2"
OUTPUT_DIR="screenshots-$2" # Directory to store screenshots

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

node "$SCRIPT_DIR/create_screenshots.js" "$URL" "$OUTPUT_DIR"

ffmpeg -framerate 16 -i "$OUTPUT_DIR/screenshot-%d.png" -c:v libvpx-vp9 -pix_fmt yuva420p -vf "scale=320:240,fps=16" -r 16 -auto-alt-ref 0 -loop 0 "$OUTPUT_FILE"

rm -rf "$OUTPUT_DIR"

echo "File created: $OUTPUT_FILE"
