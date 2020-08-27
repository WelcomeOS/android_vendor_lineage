#!/bin/bash

PRODUCT_OUT="$1"
WIDTH="$2"
HEIGHT="$3"
HALF_RES="$4"

OUT="$PRODUCT_OUT/obj/SHUTDOWNANIMATION"

RESOLUTION=""$WIDTH"x"$HEIGHT""

for part_cnt in 0 1
do
    mkdir -p "$OUT/shutdownanimation/part$part_cnt"
done
tar xfp "vendor/lineage/bootanimation/shutdownanimation.tar" -C "$OUT/shutdownanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/shutdownanimation/"*"/"*".png"

# Create desc.txt
echo "$WIDTH $HEIGHT" 6 > "$OUT/shutdownanimation/desc.txt"
cat "vendor/lineage/shutdownanimation/desc.txt" >> "$OUT/shutdownanimation/desc.txt"

# Create audio.wav
cp "vendor/lineage/shutdownanimation/audio.wav" "$OUT/shutdownanimation/part0/audio.wav"

# Create shutdownanimation.zip
cd "$OUT/shutdownanimation"

zip -qr0 "$OUT/shutdownanimation.zip" .
