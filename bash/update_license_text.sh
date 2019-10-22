#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Incorrect number of arguments ($# provided, 1 expected)"
    exit 1
fi

directory=$1

LIC=$(<copyright-matlab-latex.txt)
# update license text in MATLAB files
export LIC
find $directory -iname "*.m" -type f | while read -r line ; do
    echo "Processing $line"
    perl -i -pe 'BEGIN{undef $/;} s/% Copyright.*uni-rostock.de\*/$ENV{LIC}/smg' "$line"
done
# update license text in LaTeX files
find $directory -iname "*.tex" -type f | while read -r line ; do
    echo "Processing $line"
    perl -i -pe 'BEGIN{undef $/;} s/% Copyright.*uni-rostock.de\*/$ENV{LIC}/smg' "$line"
done

# update license text in gnuplot files
LIC=$(<copyright-gnuplot.txt)
export LIC
find $directory -iname "*.gnu" -type f | while read -r line ; do
    echo "Processing $line"
    perl -i -pe 'BEGIN{undef $/;} s/# Copyright.*uni-rostock.de\*/$ENV{LIC}/smg' "$line"
done
