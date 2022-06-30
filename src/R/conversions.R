
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

amodulo <- function(a, b)
{
  return(x <- a - b * floor(a/b))
}

# Returns a rotation matrix based on the axis (x, y, or z) and the angle phi
# The angle phi is expected to be in radians
rotation_matrix <- function(axis, phi)
{
  mat <- matrix(0.0, nrow = 3, ncol = 3)
  cosphi <- cos(phi)
  sinphi <- sin(phi)
  
  if (axis == 1) {
    mat[1,1] <- 1.0
    mat[2,2] <- cosphi
    mat[3,3] <- cosphi
    mat[2,3] <- sinphi
    mat[3,2] <- -sinphi
  } else if (axis == 2) {
    mat[1,1] <- cosphi
    mat[1,3] <- -sinphi
    mat[2,2] <- 1.0
    mat[3,1] <- sinphi
    mat[3,3] <- cosphi
  } else if (axis == 3){
    mat[1,1] <- cosphi
    mat[2,2] <- cosphi
    mat[3,3] <- 1.0
    mat[2,1] <- -sinphi
    mat[1,2] <- sinphi
  } else {print("Axis is wrong value")}
  
  return (mat)
}

# Interpolate three values using the interpolating value n
interpolate <- function(vec, n)
{
  # Take differences
  a <- vec[2] - vec[1]
  b <- vec[3] - vec[2]
  c <- b - a
  
  y <- vec[2] + n/2 * (a + b + n * c)
  
  return(y)
}
