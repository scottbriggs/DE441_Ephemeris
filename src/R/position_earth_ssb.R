 
# Calculate the position of the Earth

position_earth_ssb <- function(jd_tdb)
{
  # Get the position and velocity of the earth-moon barycenter and moon
  emb_pos_vel <- position_emb_ssb(jd_tdb)
  moon_pos_vel <- position_moon_geo(jd_tdb)
  
  # Calculate the position and velocity of the earth
  earth_pos_vel <- matrix(0.0, nrow=2, ncol=3)
  temp <- 1 + EMRAT
  earth_pos_vel <- emb_pos_vel - (moon_pos_vel / temp)
  
  return(earth_pos_vel)
}