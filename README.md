<img src="man/figures/hexsticker_for_roroph.png" align="right" height="139" />

# roroph: Roll-on/Roll-Off (RoRo) Connectivity and Transport Data

## Overview
The `roroph` package provides a standardized, machine-readable geospatial dataset of the primary and missionary routes comprising the Philippine Nautical Highway System. It is designed to serve as 2025–2026 Structural Baseline for spatial data science, regional science, and transport logistics analysis. While the topology remains a stationary reference, the attribute data serves as the validated benchmark for longitudinal comparative studies.

Unlike traditional distance-based spatial models, `roroph` treats the Philippine archipelago as a **Network Topology**. The package provides the necessary edge-list and node-attribute data to move beyond simple Euclidean distance ($d$) and into Frictional Connectivity, accounting for:

**Node Adjacency:** Directed links between 40+ coastal provinces.

**Temporal Friction:** Average travel time in hours ($T$) across the sea-gap.

**Flow Capacity:** Daily frequency ($f$), passenger capacity, and cargo volume.

By focusing on Network Topology rather than a Coordinate Grid, `roroph` provides the stationary infrastructure layer required for modeling Signal Propagation (e.g., price transmission, viral spread, or supply chain shocks) across the Philippine archipelago.

## The Frequency-Based Weights ($W$)
roroph provides the raw infrastructure (the Edges) and the native functions to construct Frequency-Weighted Adjacency Matrices. In an archipelagic context, Euclidean distance ($d_{ij}$) is a "Geographic Illusion" that ignores the physical constraints of the water. By defining the "nearness" of two provinces by the bandwidth of their maritime connection ($f$), roroph enables researchers to capture the 97% spatial signal found in national price transmission.

## Integration with ArchipelagoEngine
While `roroph` defines the Spatial Weights ($W$), it is designed to be the primary data-input for the `ArchipelagoEngine` (v0.1.2). The engine utilizes these maritime weights to perform Maximum Likelihood Estimation, correcting for the residual spatial bias ($p < 0.05$) often found in terminal nodes and land-border clusters.

## Installation
For the development version:
```
# install.packages("devtools")
devtools::install_github("njtalingting/roroph")
````
## Quick Start
````
library(roroph)
data("roro_routes")

# Filter for the Western Nautical Highway (WNH)
wnh_network <- roro_routes[roro_routes$highway_type == "Western", ]

# Construct an adjacency matrix from the network topology
# (See ArchipelagoEngine documentation for automated W-matrix construction)
````
## Data Source
All topological links and attributes are harmonized from 2025-2026 maritime transparency reports from the Maritime Industry Authority (MARINA) and Philippine Ports Authority (PPA). The dataset is structured to support rigorous peer-reviewed analyses in regional development and transport science.
