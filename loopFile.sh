#!/bin/bash

FILES=./Site*.tex

for f in $FILES
do "processing $f file..."
   pdflatex $f
   done
