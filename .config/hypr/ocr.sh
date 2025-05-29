#!/bin/sh

$HOME/scripts/grimblast --freeze save area /home/BB/.config/hypr/ocr.png

ret=$?
if [ $ret -ne 0 ]; then
    exit 1
fi

language=$(cat "$HOME/.config/hypr/languages.txt" | tofi --height 130)

ret=$?
if [ $ret -ne 0 ]; then
    exit 1
fi

res=$(tesseract /home/BB/.config/hypr/ocr.png stdout -l $language -c preserve_interword_spaces=1 quiet)

rm /home/BB/.config/hypr/ocr.png

notify-send "$res"
wl-copy "$res"
