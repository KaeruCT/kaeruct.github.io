#!/usr/bin/env bash
# Builds the default social card: the site icon tiled into an overlapping grid,
# each copy drawn in one of SHADES steps from full green to flat grey.
#
# Tweak with env vars, e.g.:
#   TILE=120 PATTERN=wave SHADES=5 ./scripts/make_og_image.sh
#   OUT=/tmp/try.png BG='#111111' ./scripts/make_og_image.sh
set -euo pipefail

cd "$(dirname "$0")/.."

SRC="${SRC:-static/android-chrome-512x512.png}"
OUT="${OUT:-content/images/og-default.png}"

WIDTH="${WIDTH:-1200}"
HEIGHT="${HEIGHT:-630}"
TILE="${TILE:-150}"        # size of one frog, in px
OVERLAP="${OVERLAP:-0.20}" # fraction of a tile that the next one covers
OVERLAP_X="${OVERLAP_X:-$OVERLAP}"
OVERLAP_Y="${OVERLAP_Y:-$OVERLAP}"
BG="${BG:-#242629}" # theme dark background

SHADES="${SHADES:-4}"                 # how many steps from green to grey
GREY_SATURATION="${GREY_SATURATION:-0}"   # saturation of the last step
GREY_BRIGHTNESS="${GREY_BRIGHTNESS:-70}"  # brightness of the last step
PATTERN="${PATTERN:-scatter}"         # diagonal | wave | checker | radial | scatter
SEED="${SEED:-7}"                     # only used by scatter
TILE_OPACITY="${TILE_OPACITY:-100}"

command -v magick >/dev/null || { echo "ImageMagick (magick) not found" >&2; exit 1; }

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

magick "$SRC" -filter point -resize "${TILE}x${TILE}" \
    -channel A -evaluate multiply "$(echo "$TILE_OPACITY / 100" | bc -l)" +channel \
    "$tmp/shade_0.png"

# Step 0 is the untouched icon; the rest fade towards the grey end.
for ((i = 1; i < SHADES; i++)); do
    t=$(echo "$i / ($SHADES - 1)" | bc -l)
    sat=$(printf '%.0f' "$(echo "100 + ($GREY_SATURATION - 100) * $t" | bc -l)")
    bri=$(printf '%.0f' "$(echo "100 + ($GREY_BRIGHTNESS - 100) * $t" | bc -l)")
    magick "$tmp/shade_0.png" -modulate "${bri},${sat}" "$tmp/shade_$i.png"
done

# Overlapping tiles advance by less than their own width.
step_x=$(echo "$TILE * (1 - $OVERLAP_X)" | bc -l)
step_y=$(echo "$TILE * (1 - $OVERLAP_Y)" | bc -l)
cols=$(echo "($WIDTH + $TILE) / $step_x" | bc)
rows=$(echo "($HEIGHT + $TILE) / $step_y" | bc)

# Centre the grid so the cropped edges are even on both sides.
x0=$(echo "($WIDTH - ($cols - 1) * $step_x - $TILE) / 2" | bc -l)
y0=$(echo "($HEIGHT - ($rows - 1) * $step_y - $TILE) / 2" | bc -l)

shade_for() {
    local col=$1 row=$2 d
    case "$PATTERN" in
        diagonal) echo $(((col + row) % SHADES)) ;;
        wave) echo $(((col + 2 * row) % SHADES)) ;;
        checker) echo $(((col % 2 + 2 * (row % 2)) % SHADES)) ;;
        radial)
            d=$(printf '%.0f' "$(echo "sqrt(($col - ($cols - 1) / 2)^2 + ($row - ($rows - 1) / 2)^2)" | bc -l)")
            echo $((d % SHADES))
            ;;
        scatter) echo $(((col * 7 + row * 13 + SEED) % SHADES)) ;;
        *)
            echo "unknown PATTERN: $PATTERN" >&2
            exit 1
            ;;
    esac
}

: >"$tmp/draw.mvg"
for ((row = 0; row < rows; row++)); do
    for ((col = 0; col < cols; col++)); do
        x=$(printf '%.0f' "$(echo "$x0 + $col * $step_x" | bc -l)")
        y=$(printf '%.0f' "$(echo "$y0 + $row * $step_y" | bc -l)")
        echo "image over $x,$y $TILE,$TILE '$tmp/shade_$(shade_for "$col" "$row").png'" >>"$tmp/draw.mvg"
    done
done

mkdir -p "$(dirname "$OUT")"
magick -size "${WIDTH}x${HEIGHT}" "xc:$BG" -draw "@$tmp/draw.mvg" -strip "$OUT"

echo "wrote $OUT  ${WIDTH}x${HEIGHT}  tile=${TILE} overlap=${OVERLAP_X}/${OVERLAP_Y}" \
    "grid=${cols}x${rows} shades=${SHADES} pattern=${PATTERN}"
