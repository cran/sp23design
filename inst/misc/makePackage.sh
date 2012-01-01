#!/bin/bash
## Script to build R files from the Rnw file.
##Rscript -e 'remove.packages("sp23design")'
mkdir sp23-test
cd sp23-test
cp ../sp23design.Rnw .
Rscript -e 'Stangle("sp23design.Rnw", split=TRUE)'
rm sp23design.Rnw
## The two files below are incorporated in the code chunks and so can be deleted
rm sp23design*Parameters.R sp23design-Run-Code.R
mkdir units R
cat sp23design-Case*.R sp23design-Run*.R > units/runitTests.R
rm sp23design-Case*.R sp23design-Run*.R
cat *.R > R/sp23design.R
rm *.R
cd ..
cp sp23-test/R/sp23design.R ../../R
cp sp23-test/units/runitTests.R  ../unitTests
rm -rf sp23-test

