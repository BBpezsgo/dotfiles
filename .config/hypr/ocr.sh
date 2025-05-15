#!/bin/sh
hyprshot -m region -o /home/BB/.config/hypr -f ocr.png -s
res=$(tesseract /home/BB/.config/hypr/ocr.png stdout -l jpn -c preserve_interword_spaces=1 quiet)
rm /home/BB/.config/hypr/ocr.png
notify-send "$res"
wl-copy "$res"
