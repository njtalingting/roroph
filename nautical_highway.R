## code to prepare `roro_routes` dataset for the roroph package
## Prepared by NJ Talingting

# 1. Provincial Lookup Table
geo_lookup <- data.frame(
  prov = c("Batangas", "OrientalMindoro", "OccidentalMindoro", "Aklan", "Iloilo",
           "NegrosOccidental", "NegrosOriental", "ZamboangadelNorte", "ZamboangadelSur",
           "MisamisOccidental", "Sorsogon", "Masbate", "Cebu", "Bohol", "Leyte",
           "SouthernLeyte", "Camiguin", "MisamisOriental", "AgusandelNorte",
           "NorthernSamar", "Samar", "SurigaodelNorte", "DinagatIslands", "Batanes",
           "IlocosNorte", "Quezon", "Marinduque", "Polillo", "Romblon", "Antique",
           "Siquijor", "Basilan", "Sulu", "Tawi-Tawi", "CamarinesSur", "Albay",
           "Guimaras", "DavaodelNorte", "Samal", "Palawan"),
  lat = c(13.7565, 13.4116, 13.2000, 11.7061, 10.7202, 10.6765, 9.3103, 8.5200,
          7.8400, 8.4800, 12.9733, 12.3686, 10.3157, 9.6500, 11.0000, 10.2000,
          9.2000, 8.4800, 9.0000, 12.5000, 11.8000, 9.7800, 10.1000, 20.4500,
          18.1900, 13.9300, 13.4000, 14.7000, 12.5000, 11.0000, 9.2000, 6.6000,
          6.0000, 5.1000, 13.6000, 13.1000, 10.6000, 7.4000, 7.0000, 9.7400),
  lon = c(121.0583, 121.1814, 120.6000, 122.3650, 122.5621, 122.9509, 123.3081,
          123.3400, 123.4400, 123.8000, 124.0044, 123.6339, 123.8854, 123.8500,
          124.8000, 124.9500, 124.7000, 124.6500, 125.5000, 124.6000, 124.9000,
          125.4900, 125.6000, 121.9700, 120.5900, 121.6100, 121.9000, 121.9000,
          122.2000, 122.1000, 123.5000, 122.0000, 121.0000, 119.9000, 123.3000,
          123.7000, 122.6000, 125.7000, 125.7000, 118.7400),
  region = c("Luzon", "Luzon", "Luzon", "Visayas", "Visayas", "Visayas", "Visayas",
             "Mindanao", "Mindanao", "Mindanao", "Luzon", "Luzon", "Visayas",
             "Visayas", "Visayas", "Visayas", "Mindanao", "Mindanao", "Mindanao",
             "Visayas", "Visayas", "Mindanao", "Mindanao", "Luzon", "Luzon", "Luzon",
             "Luzon", "Luzon", "Luzon", "Visayas", "Visayas", "Mindanao", "Mindanao",
             "Mindanao", "Luzon", "Luzon", "Visayas", "Mindanao", "Mindanao", "Luzon"),
  stringsAsFactors = FALSE
)

# 2. Main Directed Links
all_links <- data.frame(
  from_prov = c(
    "Batangas", "OrientalMindoro", "OrientalMindoro", "Aklan", "Iloilo", "NegrosOccidental", "NegrosOriental", "ZamboangadelNorte", "ZamboangadelNorte",
    "Sorsogon", "Masbate", "Cebu", "Cebu", "Cebu", "Bohol", "Bohol", "Camiguin", "MisamisOriental", "Cebu",
    "Sorsogon", "NorthernSamar", "Leyte", "SouthernLeyte", "SurigaodelNorte",
    "Batanes", "OccidentalMindoro", "OccidentalMindoro", "Quezon", "Quezon", "Quezon", "Quezon", "Romblon", "Palawan", "Palawan", "Antique", "Siquijor", "Basilan", "Sulu", "Tawi-Tawi", "CamarinesSur", "Albay", "Guimaras", "Marinduque", "DavaodelNorte", "Cebu", "Cebu", "Cebu", "Cebu", "Samar", "SouthernLeyte", "Bohol", "MisamisOriental", "Palawan", "Palawan"
  ),
  to_prov = c(
    "OrientalMindoro", "Aklan", "OccidentalMindoro", "Iloilo", "NegrosOccidental", "NegrosOriental", "ZamboangadelNorte", "ZamboangadelSur", "MisamisOccidental",
    "Masbate", "Cebu", "Bohol", "NegrosOccidental", "Leyte", "Camiguin", "Leyte", "MisamisOriental", "AgusandelNorte", "Masbate",
    "NorthernSamar", "Samar", "SouthernLeyte", "SurigaodelNorte", "DinagatIslands",
    "IlocosNorte", "Batangas", "OrientalMindoro", "Marinduque", "Polillo", "Masbate", "Romblon", "Antique", "Iloilo", "Aklan", "Iloilo", "NegrosOriental", "ZamboangadelSur", "ZamboangadelSur", "ZamboangadelSur", "Masbate", "Masbate", "Iloilo", "Quezon", "Samal", "Samar", "Iloilo", "Masbate", "Leyte", "Masbate", "Bohol", "Cebu", "Camiguin", "OrientalMindoro", "Antique"
  ),
  route_name = c(
    "Batangas-Calapan", "Roxas-Caticlan", "Bulalacao-SanJose", "Caticlan-Dumangas", "Iloilo-Bacolod", "Bacolod-Dumaguete", "Dumaguete-Dapitan", "Dapitan-Zamboanga", "Dapitan-Ozamiz",
    "Pilar-Aroroy", "Cawayan-Bogo", "Cebu-Tagbilaran", "Toledo-SanCarlos", "Cebu-Ormoc", "Jagna-Balbagon", "Ubay-Hilongos", "Benoni-Balingoan", "CagayanDeOro-Nasipit", "Daanbantayan-Mobo",
    "Matnog-Allen", "Allen-Catbalogan", "Ormoc-Liloan", "Liloan-Lipata", "Surigao-SanJose",
    "Basco-Currimao", "AbraDeIlog-Batangas", "AbraDeIlog-SanJuan", "Lucena-Balanacan", "Real-Polillo", "Lucena-Masbate", "Lucena-Odiongan", "Odiongan-Lipata", "Cuyo-Iloilo", "Cuyo-Roxas", "SanJose-Iloilo", "Larena-Dumaguete", "Isabela-Zamboanga", "Jolo-Zamboanga", "Bongao-Zamboanga", "Pasacao-SanPascual", "Pantao-SanPascual", "Jordan-Iloilo", "Lucena-Buyabod", "Davao-Samal", "Daanbantayan-Calbayog", "Tabuelan-Ajuy", "Hagnaya-Cawayan", "Poro-Isabel", "Calbayog-Cataingan", "Maasin-Ubay", "Jetafe-PuntaEngano", "Balingoan-Guinsiliban", "PuertoPrincesa-Bulalacao", "Cuyo-SanJose"
  ),
  dist_nm = c(24.5, 42.0, 28.0, 55.0, 25.0, 48.0, 44.0, 120.0, 40.0, 32.0, 45.0, 40.0, 18.0, 58.0, 30.0, 26.0, 10.0, 65.0, 52.0, 11.5, 40.0, 85.0, 32.0, 15.0, 180.0, 45.0, 35.0, 30.0, 22.0, 110.0, 60.0, 42.0, 110.0, 65.0, 48.0, 22.0, 18.0, 95.0, 210.0, 45.0, 38.0, 12.0, 35.0, 5.0, 95.0, 42.0, 48.0, 32.0, 55.0, 28.0, 35.0, 12.0, 65.0, 55.0),
  avg_time_hrs = c(2.5, 4.0, 3.0, 5.5, 1.5, 5.0, 4.0, 12.0, 4.5, 3.0, 6.0, 2.0, 1.5, 3.0, 3.0, 2.5, 1.0, 6.0, 5.0, 1.2, 3.0, 6.0, 3.5, 1.5, 18.0, 4.0, 3.5, 3.0, 2.0, 10.0, 6.0, 4.0, 12.0, 6.0, 4.5, 2.0, 1.5, 8.0, 20.0, 4.0, 3.5, 1.0, 3.5, 0.5, 8.5, 4.0, 4.5, 3.0, 5.0, 3.0, 3.5, 1.2, 6.0, 5.0),
  freq_daily = c(24, 8, 4, 4, 12, 4, 6, 2, 4, 6, 2, 10, 14, 8, 2, 4, 16, 2, 2, 48, 2, 2, 8, 6, 0.1, 4, 4, 6, 4, 2, 2, 4, 1, 2, 4, 6, 8, 2, 1, 2, 2, 16, 4, 24, 2, 4, 4, 6, 2, 4, 4, 8, 2, 2),
  pax_cap = c(500, 300, 250, 300, 800, 400, 600, 800, 350, 200, 150, 1000, 500, 800, 400, 300, 400, 1000, 300, 500, 200, 300, 400, 200, 100, 300, 250, 200, 100, 200, 150, 200, 400, 300, 300, 200, 200, 300, 400, 200, 200, 300, 200, 50, 200, 300, 300, 400, 200, 300, 300, 200, 300, 300),
  cargo_cap = c(40, 25, 20, 20, 50, 30, 45, 60, 25, 15, 10, 60, 40, 50, 20, 20, 35, 80, 20, 40, 15, 20, 35, 15, 5, 20, 20, 15, 10, 15, 12, 15, 30, 25, 25, 15, 15, 20, 35, 15, 15, 20, 15, 5, 15, 20, 25, 30, 15, 20, 20, 15, 25, 25),
  marina_code = paste0(rep(c("WNH", "CNH", "ENH", "MR"), c(9, 10, 5, 30)), "-", sprintf("%02d", c(1:9, 1:10, 1:5, 1:30))),
  stringsAsFactors = FALSE
)

# NEW: Add highway_type classification here
all_links$highway_type <- factor(
  ifelse(grepl("WNH", all_links$marina_code), "Western",
         ifelse(grepl("CNH", all_links$marina_code), "Central",
                ifelse(grepl("ENH", all_links$marina_code), "Eastern", "Missionary"))),
  levels = c("Western", "Central", "Eastern", "Missionary")
)

# 3. Merge Geospatial & Regional Data
all_links <- merge(all_links, geo_lookup, by.x = "from_prov", by.y = "prov")
names(all_links)[(ncol(all_links)-2):ncol(all_links)] <- c("from_lat", "from_lon", "from_region")

all_links <- merge(all_links, geo_lookup, by.x = "to_prov", by.y = "prov")
names(all_links)[(ncol(all_links)-2):ncol(all_links)] <- c("to_lat", "to_lon", "to_region")

# 4. Create Symmetric Bidirectional Dataset
roro_routes <- rbind(
  all_links,
  data.frame(
    from_prov = all_links$to_prov, to_prov = all_links$from_prov,
    route_name = all_links$route_name, marina_code = all_links$marina_code,
    highway_type = all_links$highway_type, # Ensure this is included
    dist_nm = all_links$dist_nm, avg_time_hrs = all_links$avg_time_hrs,
    freq_daily = all_links$freq_daily, pax_cap = all_links$pax_cap,
    cargo_cap = all_links$cargo_cap, from_lat = all_links$to_lat,
    from_lon = all_links$to_lon, from_region = all_links$to_region,
    to_lat = all_links$from_lat, to_lon = all_links$from_lon,
    to_region = all_links$from_region, stringsAsFactors = FALSE
  )
)

# 5. Finalize Object
roro_routes <- unique(roro_routes)
