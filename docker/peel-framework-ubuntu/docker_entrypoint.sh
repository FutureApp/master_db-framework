#!/bin/sh
cwd=$(pwd)

# Runs the peel-wordcount-standard test
echo "Running the wordcount.default test-suite from the peel-framework"
cd "$BUNDLE_BIN/$BUNDLE_AID"; ./peel.sh suite:run wordcount.default

