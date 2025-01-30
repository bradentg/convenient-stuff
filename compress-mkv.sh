#!/bin/bash
read -p "Input filename: " input_file
#read -p "Constant Rate Factor (0-51) [default 28]: " crf
#crf=${crf:-28}
#read -p "Preset (ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow): " preset
#preset=${preset:-medium}
output_file="${input_file%.*}_compressed.mkv"
ffmpeg -i "$input_file" -c:v libx264 -crf 27 -preset slow -c:a aac -b:a 192k -c:s copy "$output_file"
# echo "The following will run:"
# echo "ffmpeg -i "$input_file" -c:v libx264 -crf 28 -preset medium -c:a aac -b:a 192k -c:s copy "$output_file""
