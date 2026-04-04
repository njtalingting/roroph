# roroph: Roll-on/Roll-Off (RoRo) Connectivity and Transport Data

## Overview
The `roroph` package provides a standardized, machine-readable geospatial dataset of the 108 primary and missionary routes comprising the Philippine Nautical Highway System. It is designed
to serve as a structural layer for spatial data science, regional science, and transport logistics analysis.

Unlike traditional distance-based spatial models, `roroph` treats the Philippine archipelago as a living network. It provides the necessary edge-list and node-attribute data to move beyond simple Euclidean distance ($d$) and into Frictional Connectivity, accounting for:

*Node Adjacency:* Directed links between 45 coastal provinces.

*Temporal Friction:* Average travel time in hours ($T$) across the sea-gap.

*Flow Capacity:* Daily frequency ($f$), passenger capacity, and cargo volume.

## Installation
For the development version:
```
# install.packages("devtools")
devtools::install_github("njtalingting/roroph")

## Applications
This package is built to integrate seamlessly with ArchipelagoEngine. Use roroph to construct custom **Spatial Weight Matrices ($W$)** based on maritime frequency rather than just 
contiguity.

library(roroph)
data("roro_routes")

# Filter for the Western Nautical Highway (WNH)
wnh_network <- roro_routes[roro_routes$highway_type == "Western", ]

# Use these links to build a directed spatial graph
# (Integration hooks for ArchipelagoEngine 0.1.2)
````

## Data Source
All topological links and attributes are harmonized from 2025-2026 maritime transparency reports from the Maritime Industry Authority (MARINA) and Philippine 
Ports Authority (PPA). The dataset is structured to support analyses in regional development studies.
