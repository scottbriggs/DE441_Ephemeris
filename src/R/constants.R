
# Mathematical Constants
PI <- 3.14159265358979
PI2 <- 2*PI
RAD2DEG <- PI/180 # Radians to degrees
DEG2RAD <- 180/PI # Degrees to radians
ARCSEC2RAD <- 3600*180/PI # Arcseconds to radians
RAD2ARCSEC <- PI/180/3600 # Radians to arcseconds
DEG2ARCSEC <- DEG2RAD*RAD2ARCSEC # Degrees to arcseconds
ARCSEC2DEG <- ARCSEC2RAD*RAD2DEG # Arcseconds to degrees
SEC2DAY <- 86400 # Seconds per Day

# Astronomical Constants
KM2AU <- 149597870.7 # Astronomical Unit in Kilometers (KM)
M2AU <- 1.495978707E11 # Astronomical Unit in Meters
CLIGHT <- 299792.458 # Speed of Light in KM per sec
CAUD <- 173.144633 # Speed of Light in AU / day
GAUSSK <- 0.01720209895 # Gaussian Gravitational Constant
EMRAT <- 81.3005690741906 # EMRAT
MUC <- 2 * GAUSSK * GAUSSK / CAUD * CAUD # MUC
EARTHRADM <- 6378140.0 # Equatorial Radius of the Earth in meters
EARTHRADAU <- EARTHRADM / 1000 / KM2AU # Equatorial Radius of the Earth in AU
FLAT <- 1/298.257 # Flattening of the Earth's reference ellipsoid (IAU 1976)
EPOCHJ2000 <- 2451545.0 # Julian day for J2000
DAYSJULCENT <- 36525 # Days per julian century
ROTANGVELEARTH <- 7.29211511467e-5 # Rotational angular velocity of the Earth in radians/second

# DE441 Constants
DAYSPERBLOCK <- 32 # DE441 days per block
NUMSUBINTMERCURY <- 4 # Number of subintervals for Mercury
NUMCOEFFMERCURY <- 14 # Number of coefficients for Mercury
NUMSUBINTVENUS <- 2 # Number of subintervals for Venus
NUMCOEFFVENUS <- 10 # Number of coefficients for Venus
NUMSUBINTEMB <- 2 # Number of subintervals for EMB
NUMCOEFFEMB <- 13 # Number of coefficients for EMB
NUMSUBINTMARS <- 1 # Number of subintervals for Mars
NUMCOEFFMARS <- 11 # Number of coefficients for Mars
NUMSUBINTJUPITER <- 1 # Number of subintervals for Jupiter
NUMCOEFFJUPITER <- 8 # Number of coefficients for Jupiter
NUMSUBINTSATURN <- 1 # Number of subintervals for Saturn
NUMCOEFFSATURN <- 7 # Number of coefficients for Saturn
NUMSUBINTURANUS <- 1 # Number of subintervals for Uranus
NUMCOEFFURANUS <- 6 # Number of coefficients for Uranis
NUMSUBINTNEPTUNE <- 1 # Number of subintervals for Neptune
NUMCOEFFNEPTUNE <- 6 # Number of coefficients for Neptune
NUMSUBINTPLUTO <- 1 # Number of subintervals for Pluto
NUMCOEFFPLUTO <- 6 # Number of coefficients for Pluto
NUMSUBINTMOON <- 8 # Number of subintervals for the Moon
NUMCOEFFMOON <- 13 # Number of coefficients for the Moon
NUMSUBINTSUN <- 2 # Number of subintervals for the Sun
NUMCOEFFSUN <- 11 # Number of coefficients for the Sun
NUMSUBINTNUTATION <- 4 # Number of subintervals for the Nutations
NUMCOEFFNUTATION <- 10 # Number of coefficients for the Nutations
