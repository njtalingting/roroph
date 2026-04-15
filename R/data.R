#' @import dplyr
#' @import sf
#' @import spdep
#' @importFrom ggplot2 ggplot aes geom_line
NULL

#' Philippine RoRo Connectivity Network
#'
#' A comprehensive dataset of the Philippine Strong Republic
#' Nautical Highway (SRNH) and Missionary Routes (2024-2026).
#'
#' @format A data frame with 108 rows and 16 variables:
#' \describe{
#'   \item{from_prov}{Origin province name, GADM-standardized}
#'   \item{to_prov}{Destination province name, GADM-standardized}
#'   \item{route_name}{The official name of the ferry connection}
#'   \item{dist_nm}{Distance in nautical miles}
#'   \item{avg_time_hrs}{Average travel time in hours}
#'   \item{freq_daily}{Average daily frequency of trips (The Weight)}
#'   \item{pax_cap}{Estimated passenger capacity}
#'   \item{cargo_cap}{Estimated truck units (Logistical Flow)}
#'   \item{marina_code}{Official MARINA classification code}
#'   \item{highway_type}{Western, Central, Eastern, or Missionary}
#'   \item{from_lat}{Origin Latitude}
#'   \item{from_lon}{Origin Longitude}
#'   \item{from_region}{Luzon, Visayas, or Mindanao}
#'   \item{to_lat}{Destination Latitude}
#'   \item{to_lon}{Destination Longitude}
#'   \item{to_region}{Destination Region}
#' }
#' @source Philippine Ports Authority (PPA) and MARINA (2025).
"roro_routes"
