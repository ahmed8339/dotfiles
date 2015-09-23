#!/bin/bash -e
#-------------------------------------------------------------------------------
#
# xcode/xccheck.sh
# Validate Xcode application binary integrity using `spctl`
#
#-------------------------------------------------------------------------------
for xcode_version in $(ls -d /Applications/Xcode*.app)
do
  echo "Checking integrity of ${xcode_version}"
  spctl --assess --verbose "${xcode_version}"
done
