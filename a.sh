#!/bin/bash
CMD='sed '"'"'s|\# |\#: |'"'"' | sed '"'"'s|=||'"'"' | grep -v foreground_bold | grep -v '"'"'[color]'"'"''
files="$(find -regex '.*.config')"

find termite-colors -type d -print0 >dirs.txt
sed -i 's/termite/kitty/g' dirs.txt
xargs -0 mkdir -p < dirs.txt

for i in $files; do
    echo "$i"
    cat "$i" | sed 's|\# |\#: |' | sed 's|=||' | grep -v foreground_bold | grep -v '\[colors\]' > ${i//termite/kitty}
done
