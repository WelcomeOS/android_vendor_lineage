#!/bin/bash

PRODUCT_OUT="$1"
WIDTH="$2"
HEIGHT="$3"
HALF_RES="$4"

OUT="$PRODUCT_OUT/obj/BOOTANIMATION"

RESOLUTION=""$WIDTH"x"$HEIGHT""

for part_cnt in 0 1
do
    mkdir -p "$OUT/bootanimation/part$part_cnt"
done
tar xfp "vendor/lineage/bootanimation/bootanimation.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".png"

# Create desc.txt
echo "$WIDTH $HEIGHT" 5 > "$OUT/bootanimation/desc.txt"
cat "vendor/lineage/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create audio.wav
cp "vendor/lineage/bootanimation/audio.wav" "$OUT/bootanimation/part0/audio.wav"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
