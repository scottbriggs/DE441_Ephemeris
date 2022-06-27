
# Calculate the apparent place of the Sun

apparent_place_sun <- function(jd_tdb)
{
  # Start with calculating the time of interest
  T_prime <- (jd_tdb - EPOCHJ2000) / DAYSJULCENT
  mean_anomaly <- (357.528 + 35999.050 * T_prime) * PI2 / 360
  s <- 0.001658 * sin(mean_anomaly + 0.01671 * sin(mean_anomaly))
  t <- jd_tdb + s / SEC2DAY
  T <- (t - EPOCHJ2000) / DAYSJULCENT
  
  # Extract the barycentric position of the Earth
  earth_ssb <- position_earth_ssb(t)
  earth_ssb_au <- earth_ssb / KM2AU
  
  # Extract the barycentric position of the Sun
  sun_ssb <- position_sun_ssb(t)
  sun_ssb_au <- sun_ssb / KM2AU
  
  # Calculate the geometric distance between the positions of the center of mass
  # of the Sun and the Earth
  d <- Norm(sun_ssb_au[1,] - earth_ssb_au[1,])
  tau <- d / CAUD
  
  # Extract the barycentric position of the Sun at t -tau
  sun_ssb <- position_sun_ssb(t-tau)
  sun_ssb_au <- sun_ssb / KM2AU
  
  U1 <- sun_ssb_au[1,] - earth_ssb_au[1,]
  
  # Aberration of light
  V <- earth_ssb_au[2,] / CAUD
  U2 <- U1 + Norm(sun_ssb_au[1,]) * V
  
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