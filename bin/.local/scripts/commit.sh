#!/usr/bin/env bash
for i in {1..100}; do
    echo "blank" >>blank.txt
    git add .
    git commit -m "blank"
    git push origin main
done
