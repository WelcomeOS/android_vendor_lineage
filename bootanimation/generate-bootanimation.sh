#!/bin/bash

PRODUCT_OUT="$1"
WIDTH="$2"
HEIGHT="$3"
HALF_RES="$4"

OUT="$PRODUCT_OUT/obj/BOOTANIMATION"

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    IMAGEWIDTH="$HEIGHT"
else
    IMAGEWIDTH="$WIDTH"
fi

#if [ "$HALF_RES" = "true" ]; then
#    IMAGEWIDTH=$(expr $IMAGEWIDTH / 2)
#fi

RESOLUTION=""$IMAGEWIDTH"x"$IMAGEHEIGHT""

for part_cnt in 0 1
do
    mkdir -p "$OUT/bootanimation/part$part_cnt"
done
tar xfp "vendor/lineage/bootanimation/bootanimation.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".png"

# Create desc.txt
echo "$IMAGEWIDTH $IMAGEHEIGHT" 7 > "$OUT/bootanimation/desc.txt"
cat "vendor/lineage/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create audio.wav
cp "vendor/lineage/bootanimation/audio.wav" "$OUT/bootanimation/part0/audio.wav"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
