
# Various conversions needed to algorithms

# Convert degrees, arc-minutes, and arc-seconds to decimal degrees
dms2deg <- function(deg, min, sec)
{
  sign <- 0
  
  if ( (deg<0) | (min<0) | (sec<0) ){
    sign <- -1
  }else {
    sign <- 1
  }
  return( sign * (abs(deg) + abs(min) /60 + abs(sec) / 3600))
}

# Convert decimal degrees to degrees, arc-minutes, and arc-seconds
deg2dms <- function(deg)
{
  x <- abs(deg)
  D <- as.integer(x)
  x <- (x - D) * 60.0
  M <- as.integer(x)
  S <- (x - M) * 60.0
  
  if (deg < 0.0) {
    if (D != 0) {
      D <- D * -1
    }else if (M != 0) {
      M <- M * -1
    }else {
      S <- S * -1
    }
  }
  return(list(c(D, M, S)))
}

# Convert a position vector (x, y, z) to polar angles (r, phi, theta)
# phi is RA
# theta is Dec
polar_angles <- function(pos)
{
  rho_sqr <- pos[1] * pos[1] + pos[2] * pos[2]
  m_r <- sqrt(rho_sqr + pos[3] * pos[3])
  m_phi <- 0.0
  
  if (pos[1] == 0.0 & pos[2] == 0.0) {
    m_phi <- 0.0
  } else {
    m_phi <- atan2(pos[2], pos[1])
  }
  
  if (m_phi < 0.0) {m_phi <- m_phi + PI2}
  
  rho <- sqrt(rho_sqr)
  m_theta <- 0.0
  
  if (pos[3] == 0.0 & rho == 0.0) {
    m_theta <- 0.0
  } else {
    m_theta <- atan2(pos[3], rho)
  }
  
  return(list(c(m_r, m_phi, m_theta)))
}
