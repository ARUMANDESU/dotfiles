#!/usr/bin/bash
LANG=en_EN ldconfig 2> err.txt

for file in $(cut -d" " -f3 err.txt)
do
    echo $file
    pacman -S $(pacman -Fq $file) --noconfirm --overwrite "*"
done