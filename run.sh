#!/bin/bash
rm -fr specgen_input
git clone https://github.com/nsip/specgen_input.git
mkdir -p xml
for filename in ./specgen_input/06_DataModel/Custom/Common/*.xml; do
  xsltproc sifobject.xslt "$filename" | perl xslt_postprocess.pl > xml/$(basename "$filename" .xml).go
done
for filename in ./specgen_input/06_DataModel/Custom/AU/*.xml; do
  xsltproc sifobject.xslt "$filename" | perl xslt_postprocess.pl > xml/$(basename "$filename" .xml).go
done
echo '<root xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns="http://sifassociation.org/SpecGen" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xhtml="http://www.w3.org/1999/xhtml" >' > data.xml
cat specgen_input/80_BackMatter/Custom/DataModel-CommonTypes-Custom.xml >> data.xml
echo '</root>' >> data.xml
xsltproc sifobject.xslt data.xml | perl xslt_postprocess.pl > xml/DataModel.go
