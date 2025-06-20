#!/usr/bin/env python3
"""
example_vis.py: Generate a scatter plot of ERA5 dataset values.
"""

import sys
from pathlib import Path

import matplotlib.pyplot as plt
import cartopy.crs as ccrs

from anemoi.datasets import open_dataset


def main():
    base = Path(__file__).parents[2]
    input_path = base / "datasets" / "era5-o48-2020-2021-6h-v1.zip"
    output_path = base / "results" / "plots" / "era5-2020-2021-6h-v1.png"
    ds = open_dataset(input_path)
    fig, ax = plt.subplots(subplot_kw={"projection": ccrs.PlateCarree()})
    scatter = ax.scatter(
        x=ds.longitudes,
        y=ds.latitudes,
        c=ds[0, 0, 0, :],
    )
    ax.coastlines()
    ax.gridlines(draw_labels=True)
    plt.colorbar(scatter, label="K", orientation="horizontal", pad=0.05)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(output_path, dpi=300)
    print(f"Plot saved to {output_path}")


if __name__ == "__main__":
    sys.exit(main())