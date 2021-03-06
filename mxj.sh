#!/bin/bash
# This script maps the Go structs generated by run.sh to Go structs compatible with the maps generated by MXJ; so it is purpose-specific.
# It generates custom JSON unmarshallers for arrays, and adds JSON tags that MXJ expects. Exceptionally, "#text" is mapped to Value;
# the MXJ handler needs to take care of the key #text, which UnmarshalJSON ignores.

mkdir -p sifxmlmxj
for filename in ./sifxml/*.go; do
  perl go2mxj.pl < $filename >  sifxmlmxj/$(basename "$filename" .go).go
done
cp regexp.go sifxmlmxj
