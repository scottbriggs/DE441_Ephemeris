
# Calculate the apparent place of Venus

apparent_place_venus <- function(jd_tdb)
{
  # Start with calculating the time of interest
  T_prime <- (jd_tdb - EPOCHJ2000) / DAYSJULCENT
  mean_anomaly <- (357.528 + 35999.050 * T_prime) * PI2 / 360
  s <- 0.001658 * sin(mean_anomaly + 0.01671 * sin(mean_anomaly))
  t <- jd_tdb + s / SEC2DAY
  T <- (t - EPOCHJ2000) / DAYSJULCENT
  
  earth_ssb <- position_earth_ssb(t)
  earth_ssb_au <- earth_ssb / KM2AU
  
  sun_ssb <- position_sun_ssb(t)
  sun_ssb_au <- sun_ssb / KM2AU
  
  # Calculate the heliocentric position of the earth
  earth_helio_au <- earth_ssb_au - sun_ssb_au
  
  # Calculate the first approximately to the light-travel time in AU/day
  venus_ssb <- position_venus_ssb(t)
  venus_ssb_au <- venus_ssb / KM2AU
  
  d <- Norm(venus_ssb_au[1,] - earth_ssb_au[1,])
  tau <- d / CAUD
  
  # Update by taking into account the light-time for the body of interest
  venus_ssb <- position_venus_ssb(t-tau)
  venus_ssb_au <- venus_ssb / KM2AU
  
  sun_ssb <- position_sun_ssb(t-tau)
  sun_ssb_au <- sun_ssb / KM2AU
  
  U <- venus_ssb_au - earth_ssb_au
  Q <- venus_ssb_au - sun_ssb_au
  
  # Indicates that the difference between tau and tau_prime is about 2e-08
  # d <- Norm(U[1,])
  # tau_prime <- d / CAUD
  
  # Calculate the relativistic deflection of light
  u <- U[1,] / Norm(U[1,])
  q <- Q[1,] / Norm(Q[1,])
  e <- earth_helio_au[1,] / Norm(earth_helio_au[1,])
  g1 <- MUC / Norm(earth_ssb_au[1,])
  g2 <- 1 + dot(q,e)
  dotuq_e <- dot(u,q) * e
  doteu_q <- dot(e,u) * q
  U1 <- Norm(U[1,]) * (u + g1/g2*(dotuq_e - doteu_q))
  
  # Aberration of light
  V <- earth_ssb_au[2,] / CAUD
  U2 <- U1 + Norm(U1) * V
  
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