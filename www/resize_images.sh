#!/bin/sh
# Resize and compress images in photos/ for serving online.
# The max width is 300px. Environment is Macbook.

# Create a directory to store the resized images
mkdir -p photos_resized

# Loop through each image file in the photos/ directory
for file in photos/*; do
    # Get the filename and extension
    filename=$(basename "$file")
    extension="${filename##*.}"

    # Resize the image to a maximum width of 300px
    sips --resampleWidth 300 "$file" --out "photos_resized/$filename"

    # Compress the image
    sips -s format jpeg "photos_resized/$filename" --out "photos_resized/$filename"
done