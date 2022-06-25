
# Calculate the nutation angles using the de441 data

nutation_angles <- function(jd_tdb)
{

  df <- extract_body_data("Nutation", jd_tdb)

  # Calculate the subinterval
  length_of_subinterval <- DAYSPERBLOCK / NUMSUBINTNUTATION
  subinterval <- floor(as.integer(jd_tdb - df[1,1]) / length_of_subinterval)

  # Add 1 to get the right subinterval. The above algorithm assumes the 
  # subinterval begins with 0, but they begin with 1 in the data table
  subinterval <- subinterval + 1

  # Get the single row of coefficients to compute longitude and obliquity
  temp <- subset(df, INTERVAL == subinterval)
  long_coeff <- rep(0.0, NUMCOEFFNUTATION)
  obliq_coeff <- rep(0.0, NUMCOEFFNUTATION)

  for (i in seq(from = NUMCOEFFNUTATION, to = 1, by = -1)){
    long_coeff[i] <- temp[i+3]
    obliq_coeff[i] <- temp[i+3+NUMCOEFFNUTATION]
  }

  # Convert from lists to numeric vectors. For some unknown reason, the previous
  # loop converts the numeric vectors to lists
  long_coeff <- as.numeric(unlist(long_coeff))
  obliq_coeff <- as.numeric(unlist(obliq_coeff))

  # Normalize the Julian Day
  valid_start <- df[1,1] + ((subinterval-1) * length_of_subinterval)
  valid_end <- valid_start + length_of_subinterval
  temp <- jd_tdb - valid_start
  x <- (temp / length_of_subinterval * 2.0) - 1.0

  # Calculate the Chebyshev polynomials for longitude and obliquity.
  chebyshev_nut <- rep(0.0, NUMCOEFFNUTATION)
  chebyshev_nut[1] <- 1.0
  chebyshev_nut[2] <- x

  for (i in seq(from = 3, to = NUMCOEFFNUTATION, by = 1)){
    chebyshev_nut[i] <- (2 * x * chebyshev_nut[i-1]) - chebyshev_nut[i-2]
  }

  # Calculate the longitude and obliquity components
  nut_ang <- c(0.0, 0.0)

  for (v in seq(from = 10, to = 1, by = -1)){
    nut_ang[1] <- nut_ang[1] + (chebyshev_nut[v] * long_coeff[v])
    nut_ang[2] <- nut_ang[2] + (chebyshev_nut[v] * obliq_coeff[v])
  }

  return(nut_ang)
  
}
