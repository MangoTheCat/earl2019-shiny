
# "2008 flights" dataset
# Provided as a compressed CSV file, so we uncompress here with help from readr
tmp <- tempfile(fileext = ".csv.bz2")
download.file("http://stat-computing.org/dataexpo/2009/2008.csv.bz2", tmp)
readr::write_csv(readr::read_csv(tmp), path = "data/flights08.csv")
unlink(tmp)

# Supplementary airports dataset
download.file("http://stat-computing.org/dataexpo/2009/airports.csv", "data/airports.csv")
