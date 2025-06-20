#!/usr/bin/env bash

# Paths and filenames
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DATA_DIR="${SCRIPT_DIR}/../../datasets"
ZIP_NAME="era5-o48-2020-2021-6h-v1.zip"
URL="https://data.ecmwf.int/anemoi-datasets/${ZIP_NAME}"
ZIP_PATH="${DATA_DIR}/${ZIP_NAME}"

# Create target directory if missing
mkdir -p "${DATA_DIR}"

# Download dataset
echo "Downloading ${URL} to ${ZIP_PATH}..."
wget -O "${ZIP_PATH}" "${URL}"