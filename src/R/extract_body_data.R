
# Extract DE441 data for a specific body, including nutations, and julian day

extract_body_data <- function(body, jd_start)
{
  filename <- switch(body,
                     "Mercury" = "Mercury.csv",
                     "Venus" = "Venus.csv",
                     "EMB" = "EMB.csv",
                     "Mars"= "Mars.csv",
                     "Jupiter" = "Jupiter.csv",
                     "Saturn" = "Saturn.csv",
                     "Uranus" = "Uranus.csv",
                     "Neptune" = "Neptune.csv",
                     "Pluto" = "Pluto.csv",
                     "Moon" = "Moon.csv",
                     "Sun" = "Sun.csv",
                     "Nutation" = "Nutation.csv")
  
  df <- import(here("data", "processed", filename))
  tmp <- subset(df, jd_start >= jd_begin & jd_start < jd_end)
  filename_body <- tmp$filename
  df1 <- import(here("data", "processed", filename_body))
  
  tmp1 <- subset(df1, jd_start >= Julian_Day_Start & jd_start < Julian_Day_End)
  return(tmp1)
}