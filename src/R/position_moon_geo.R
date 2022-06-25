
# Calculate the position of the Moon using the de441 data

position_moon_geo <- function(jd_tdb)
{
  df <- extract_body_data("Moon", jd_tdb)
  
  # Calculate the subinterval
  length_of_subinterval <- DAYSPERBLOCK / NUMSUBINTMOON
  subinterval <- floor(as.integer(jd_tdb - df[1,1]) / length_of_subinterval)
  
  # Add 1 to get the right subinterval. The above algorithm assumes the 
  # subinterval begins with 0, but they begin with 1 in the data table
  subinterval <- subinterval + 1
  
  # Get the single row of coefficients to compute position and velocity and
  # separate into x, y, and z components
  temp <- subset(df, INTERVAL == subinterval)
  moon_coeff_x <- rep(0.0, NUMCOEFFMOON)
  moon_coeff_y <- rep(0.0, NUMCOEFFMOON)
  moon_coeff_z <- rep(0.0, NUMCOEFFMOON)
  
  for (i in seq(from = NUMCOEFFMOON, to = 1, by = -1)){
    moon_coeff_x[i] <- temp[i+3]
    moon_coeff_y[i] <- temp[i+3+NUMCOEFFMOON]
    moon_coeff_z[i] <- temp[i+3+2*NUMCOEFFMOON]
  }
  
  # Convert from lists to numeric vectors. For some unknown reason, the previous
  # loop converts the numeric vectors to lists
  moon_coeff_x <- as.numeric(unlist(moon_coeff_x))
  moon_coeff_y <- as.numeric(unlist(moon_coeff_y))
  moon_coeff_z <- as.numeric(unlist(moon_coeff_z))
  
  # Normalize the Julian Day
  valid_start <- df[1,1] + ((subinterval-1) * length_of_subinterval)
  valid_end <- valid_start + length_of_subinterval
  temp <- jd_tdb - valid_start
  x <- (temp / length_of_subinterval * 2.0) - 1.0
  
  # Calculate the Chebyshev polynomials for position and velocity. The velocity
  # is the first derivative of the position polynomial
  chebyshev_pos <- rep(0.0, NUMCOEFFMOON)
  chebyshev_pos[1] <- 1.0
  chebyshev_pos[2] <- x
  
  chebyshev_vel <- rep(0.0, NUMCOEFFMOON)
  chebyshev_vel[1] <- 0.0
  chebyshev_vel[2] <- 1.0
  
  # Calculate the position polynomial
  for (i in seq(from = 3, to = NUMCOEFFMOON, by = 1)){
    chebyshev_pos[i] <- (2 * x * chebyshev_pos[i-1]) - chebyshev_pos[i-2]
  }
  
  # Calculate the velocity polynomial
  for (i in seq(from = 3, to = NUMCOEFFMOON, by = 1)){
    chebyshev_vel[i] <- (2 * x * chebyshev_vel[i-1]) - 
      chebyshev_vel[i-2] + (2 * chebyshev_pos[i-1])
  }
  
  # Calculate the position in kilometers and the velocity in kilometers/day
  pos_vel <- matrix(0.0, nrow=2, ncol=3)
  v <- 0
  for (v in seq(from = NUMCOEFFMOON, to = 1, by = -1)){
    pos_vel[1,1] <- pos_vel[1,1] + (chebyshev_pos[v] * moon_coeff_x[v])
    pos_vel[1,2] <- pos_vel[1,2] + (chebyshev_pos[v] * moon_coeff_y[v])
    pos_vel[1,3] <- pos_vel[1,3] + (chebyshev_pos[v] * moon_coeff_z[v])
    
    pos_vel[2,1] <- pos_vel[2,1] + (chebyshev_vel[v] * moon_coeff_x[v])
    pos_vel[2,2] <- pos_vel[2,2] + (chebyshev_vel[v] * moon_coeff_y[v])
    pos_vel[2,3] <- pos_vel[2,3] + (chebyshev_vel[v] * moon_coeff_z[v])
  }
  
  # Scale the velocity
  scale_value <- 2 * NUMSUBINTMOON / DAYSPERBLOCK
  pos_vel[2,1] = pos_vel[2,1] * scale_value
  pos_vel[2,2] = pos_vel[2,2] * scale_value
  pos_vel[2,3] = pos_vel[2,3] * scale_value
  
  # Return the data
  return(pos_vel)
}