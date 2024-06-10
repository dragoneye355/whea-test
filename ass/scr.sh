#!bin/bash
#img optimization script by au_wild @cityji #Nikhil
IMAGE_DIR="./images"
OUTPUT_DIR="./"
mkdir -p "$OUTPUT_DIR"
find "$IMAGE_DIR" -iname '*.jpg' -o -iname '*.jpeg' | while read -r img; do
  echo "Optimizing $img"
  jpegoptim --max=80 --strip-all --all-progressive "$img" --dest="$OUTPUT_DIR"
done
find "$IMAGE_DIR" -iname '*.png' | while read -r img; do
  echo "Optimizing $img"
  pngquant --quality=65-80 --ext .png --force --output "$OUTPUT_DIR/$(basename "$img")" "$img"
done
mogrify -path "$OUTPUT_DIR" -resize 1920x1920\> "$OUTPUT_DIR/*.{jpg,jpeg,png}"

echo "Optimization complete. Optimized images are in the $OUTPUT_DIR directory."
