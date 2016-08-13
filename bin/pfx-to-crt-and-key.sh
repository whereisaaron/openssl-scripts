#!/bin/bash
#------------------
#  Extract the key and certficiate in PEM format form a PFX format file
#

# Must supply the inpiut pfx file
PFX_PATH="$1"
if [ "${PFX_PATH}" == "" ]; then
 echo "Must supply pfx file path"
 exit 1
fi

# Option supply a prefix for the output files
FILENAME=$(basename "$PFX_PATH")
if [ "$2" != "" ]; then
  FILENAME_BASE=$2
else
  FILENAME_BASE="${FILENAME%.*}"
fi
echo "Using '${FILENAME_BASE}' as base for output filenames"

echo "Enter password for extracting key"
openssl pkcs12 -in "$PFX_PATH" -nocerts -out "${FILENAME_BASE}.key" -nodes

echo "Enter password for extracting certificate"
openssl pkcs12 -in "$PFX_PATH" -nokeys -clcerts -out "${FILENAME_BASE}.crt" -nodes

echo "Enter password for extracting ca bundle (intermediates)"
openssl pkcs12 -in "$PFX_PATH" -nokeys -cacerts -out "${FILENAME_BASE}-ca-bundle.crt" -nodes

echo "Done."
