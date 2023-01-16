# Libraries required
libs <- c("sf","ggplot2","geofi","dplyr","tidyr","mapview","leaflet","httr2","fs")


# Shapefile
tmpfly <- tempfile()
tmpdir <- tempdir()
download.file("https://geoportaal.maaamet.ee/docs/haldus_asustus/asustusyksus_shp.zip?t=20230104162235", tmpfly)
unzip(zipfile = tmpfly, exdir = tmpdir)
filename <- grep("shp", fs::dir_ls(tmpdir), value = TRUE)
shape <- sf::st_read(filename)

shape2 <- shape %>% filter(ONIMI == "Tallinn")

library(ggplot2)
ggplot(shape2) + geom_sf()

library(mapview)
mapview(shape2)



# Geopackage
fs::dir_ls(tmpdir) %>% fs::file_delete()

download.file("https://geoportaal.maaamet.ee/docs/katastripiirid/paev/KATASTER_EESTI_SHP.zip", tmpfly)
unzip(zipfile = tmpfly, exdir = tmpdir)
filename <- grep("shp", fs::dir_ls(tmpdir), value = TRUE)
shape <- sf::st_read(filename)



"https://geoportaal.maaamet.ee/docs/katastripiirid/paev/KATASTER_EESTI_GPKG.zip?t=20230116035600"



