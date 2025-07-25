#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <http repo>"
  exit 1
fi

git clone "$1" "/tmp/$1"

cd "/tmp/$1"

# In repo cloned
# Find kicad_sch
SCH=$(find . -type f -name "*.kicad_sch" | head -n 1)

kicad-cli sch export bom -o "/tmp/$1/n8nBom.csv" $SCH 1>&2

cat "/tmp/$1/n8nBom.csv"

cd

rm -rf "/tmp/$1" 1>&2
