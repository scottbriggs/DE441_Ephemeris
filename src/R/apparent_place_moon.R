
# Calculate the apparent place of the moon

apparent_place_moon <- function(jd_tdb)
{
  # Start with calculating the time of interest
  T_prime <- (jd_tdb - EPOCHJ2000) / DAYSJULCENT
  mean_anomaly <- (357.528 + 35999.050 * T_prime) * PI2 / 360
  s <- 0.001658 * sin(mean_anomaly + 0.01671 * sin(mean_anomaly))
  t <- jd_tdb + s / SEC2DAY
  T <- (t - EPOCHJ2000) / DAYSJULCENT
  
  earth_ssb <- position_earth_ssb(t)
  earth_ssb_au <- earth_ssb / KM2AU
  
  # Calculate the first approximately to the light-travel time in AU/day
  moon_geo <- position_moon_geo(t)
  moon_geo_au <- moon_geo / KM2AU
  
  d <- Norm(moon_geo_au[1,] - earth_ssb_au[1,])
  tau <- d / CAUD

  # Aberration of light
  V <- earth_ssb_au[2,] / CAUD
  U2 <- moon_geo_au[1,] + Norm(moon_geo_au[1,]) * V
  
  # Precession
  prec_matrix <- precession_matrix(jd_tdb)
  U3 <- prec_matrix %*% U2
  
  # Nutation
  nut_matrix <- nutation_matrix(jd_tdb)
  
  U4 <- nut_matrix %*% U3
  
  ang <- polar_angles(U4)
  ra <- deg2dms(ang[[1]][2]*RAD2HR)
  dec <- deg2dms(ang[[1]][3]*RAD2DEG)
  
  output <- list(ra, dec, d)
  names(output) <- c("Right Ascension", "Declination", "Geometric Distance")
  
  return(output)
}