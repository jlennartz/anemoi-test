#!/usr/bin/env bash

# verify CDS API keys
echo "Contents of \$HOME/.cdsapirc:"
cat "$HOME/.cdsapirc"

# paths
CONFIG="configs/datasets/era5-o48-2020-2021-6h-v1.yaml"
OUTPUT="../datasets/era5-o48-2020-2021-6h-v1.zarr"

# create dataset with anemoi-datasets from https://anemoi.readthedocs.io/projects/datasets/en/latest/usage/getting_started.html#usage-getting-started
anemoi-datasets create "${CONFIG}" "${OUTPUT}"