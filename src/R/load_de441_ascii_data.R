
# Read in a JPL DE441 ascii file and process the data into csv files for each of
# the bodies in the data: Mercury, Venus, EMB, Jupiter, Saturn, Uranus, Neptune,
# Pluto, Moon, Sun, Nutations

load_de441_ascii_data <- function(filename)
{
  # Read in the ascii file
  ascii_data <- readLines(filename)
  
  # Create vector to store the ascii data sequentially
  vect <- rep(0, 11643300)
  
  # k indexes the result vector
  # i indexs the data blocks in the file
  # j indexes the rows inside each data block
  k <- as.integer(1)
  for (i in seq(from = 2, to = 3892176, by = 341)){
    for (j in seq(from = 0, to = 339, by = 1)){
      
      # First data element in the row
      tmpstr1 <- as.character(substr(ascii_data[j+i], 4, 26))
      tmpstr1 <- chartr(old = "D", new = "E", tmpstr1)
      tmpstr1 <- as.numeric(tmpstr1)
      vect[k] <- tmpstr1
      k <- k + 1L
      
      # Second data element in the row
      tmpstr1 <- as.character(substr(ascii_data[j+i], 30, 52))
      tmpstr1 <- chartr(old = "D", new = "E", tmpstr1)
      tmpstr1 <- as.numeric(tmpstr1)
      vect[k] <- tmpstr1
      k <- k + 1L
      
      # Third data element in the row
      tmpstr1 <- as.character(substr(ascii_data[j+i], 56, 78))
      tmpstr1 <- chartr(old = "D", new = "E", tmpstr1)
      tmpstr1 <- as.numeric(tmpstr1)
      vect[k] <- tmpstr1
      k <- k + 1L
    }
  }
  
  # Extract data for Mercury
  # Column names for Mercury, which has 14 coefficients for X, Y, and Z
  mercury_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                         "X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9",
                         "X10", "X11", "X12", "X13", "X14", "Y1", "Y2", "Y3", "Y4",
                         "Y5", "Y6", "Y7", "Y8", "Y9", "Y10", "Y11", "Y12", "Y13",
                         "Y14", "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7", "Z8",
                         "Z9", "Z10", "Z11", "Z12", "Z13", "Z14")
  mercury_data = matrix(0.0,nrow=45660,ncol=45)
  colnames(mercury_data) <- mercury_col_names
  
  # Populate the intervals for Mercury
  for (i in seq(from = 1L, to = 45660L, by = 4L)){
    mercury_data[i, "INTERVAL"] <- 1
    mercury_data[i+1L, "INTERVAL"] <- 2
    mercury_data[i+2L, "INTERVAL"] <- 3
    mercury_data[i+3L, "INTERVAL"] <- 4
  }
  
  # Populate the Julian Days for Mercury
  j <- 1L
  for (i in seq(from = 1L, to = 45660L, by = 4L)){
    mercury_data[i, "Julian_Day_Start"] <- vect[j]
    mercury_data[i, "Julian_Day_End"] <- vect[j+1]
    mercury_data[i+1, "Julian_Day_Start"] <- vect[j]
    mercury_data[i+1, "Julian_Day_End"] <- vect[j+1]
    mercury_data[i+2, "Julian_Day_Start"] <- vect[j]
    mercury_data[i+2, "Julian_Day_End"] <- vect[j+1]
    mercury_data[i+3, "Julian_Day_Start"] <- vect[j]
    mercury_data[i+3, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Mercury subinterval 1
  k <- 0L
  for (i in seq(from = 1L, to = 45660L, by = 4L)){
    for (j in seq(from = 3L, to = 44L, by = 1L)){
      mercury_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate Mercury subinterval 2
  k <- 42L
  for (i in seq(from = 2L, to = 45660L, by = 4L)){
    for (j in seq(from = 3L, to = 44L, by = 1L)){
      mercury_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate Mercury subinterval 3
  k <- 84L
  for (i in seq(from = 3L, to = 45660L, by = 4L)){
    for (j in seq(from = 3L, to = 44L, by = 1L)){
      mercury_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate Mercury subinterval 4
  k <- 126L
  for (i in seq(from = 4L, to = 45660L, by = 4L)){
    for (j in seq(from = 3L, to = 44L, by = 1L)){
      mercury_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Mercury
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_mercury.csv", sep = "")
  write.csv(mercury_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for Venus
  # Column names for Venus, which has 10 coefficients for X, Y, and Z
  venus_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                       "X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9",
                       "X10", "Y1", "Y2", "Y3", "Y4", "Y5", "Y6", "Y7", "Y8",
                       "Y9", "Y10", "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7",
                       "Z8", "Z9", "Z10")
  venus_data = matrix(0.0,nrow=22830,ncol=33)
  colnames(venus_data) <- venus_col_names
  
  # Populate the intervals for Venus
  for (i in seq(from = 1L, to = 22830L, by = 2L)){
    venus_data[i, "INTERVAL"] <- 1
    venus_data[i+1L, "INTERVAL"] <- 2
  }
  
  # Populate the Julian Days for Venus
  j <- 1L
  for (i in seq(from = 1L, to = 22830L, by = 2L)){
    venus_data[i, "Julian_Day_Start"] <- vect[j]
    venus_data[i, "Julian_Day_End"] <- vect[j+1]
    venus_data[i+1, "Julian_Day_Start"] <- vect[j]
    venus_data[i+1, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Venus subinterval 1
  k <- 168L
  for (i in seq(from = 1L, to = 22830L, by = 2L)){
    for (j in seq(from = 3L, to = 32L, by = 1L)){
      venus_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate Venus subinterval 2
  k <- 198L
  for (i in seq(from = 2L, to = 22830L, by = 2L)){
    for (j in seq(from = 3L, to = 32L, by = 1L)){
      venus_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Venus
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_venus.csv", sep = "")
  write.csv(venus_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for EMB
  # Column names for EMB, which has 13 coefficients for X, Y, and Z
  emb_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                     "X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9",
                     "X10", "X11", "X12", "X13", "Y1", "Y2", "Y3", "Y4",
                     "Y5", "Y6", "Y7", "Y8", "Y9", "Y10", "Y11", "Y12", "Y13",
                     "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7", "Z8",
                     "Z9", "Z10", "Z11", "Z12", "Z13")
  emb_data = matrix(0.0,nrow=22830,ncol=42)
  colnames(emb_data) <- emb_col_names
  
  # Populate the intervals for EMB
  for (i in seq(from = 1L, to = 22830L, by = 2L)){
    emb_data[i, "INTERVAL"] <- 1
    emb_data[i+1L, "INTERVAL"] <- 2
  }
  
  # Populate the Julian Days for EMB
  j <- 1L
  for (i in seq(from = 1L, to = 22830L, by = 2L)){
    emb_data[i, "Julian_Day_Start"] <- vect[j]
    emb_data[i, "Julian_Day_End"] <- vect[j+1]
    emb_data[i+1, "Julian_Day_Start"] <- vect[j]
    emb_data[i+1, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate EMB subinterval 1
  k <- 228L
  for (i in seq(from = 1L, to = 22830L, by = 2L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      emb_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate EMB subinterval 2
  k <- 267L
  for (i in seq(from = 2L, to = 22830L, by = 2L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      emb_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for EMB
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_emb.csv", sep = "")
  write.csv(emb_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for Mars
  # Column names for Mars, which has 11 coefficients for X, Y, and Z
  mars_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                     "X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9",
                     "X10", "X11", "Y1", "Y2", "Y3", "Y4",
                     "Y5", "Y6", "Y7", "Y8", "Y9", "Y10", "Y11",
                     "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7", "Z8",
                     "Z9", "Z10", "Z11")
  mars_data = matrix(0.0,nrow=11415,ncol=36)
  colnames(mars_data) <- mars_col_names
  
  # Populate the intervals for Mars
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    mars_data[i, "INTERVAL"] <- 1
  }
  
  # Populate the Julian Days for Mars
  j <- 1L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    mars_data[i, "Julian_Day_Start"] <- vect[j]
    mars_data[i, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Mars subinterval 1
  k <- 306L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    for (j in seq(from = 3L, to = 35L, by = 1L)){
      mars_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Mars
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_mars.csv", sep = "")
  write.csv(mars_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for Jupiter
  # Column names for Jupiter, which has 8 coefficients for X, Y, and Z
  jupiter_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                         "X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8",
                         "Y1", "Y2", "Y3", "Y4", "Y5", "Y6", "Y7", "Y8",
                         "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7", "Z8")
  jupiter_data = matrix(0.0,nrow=11415,ncol=27)
  colnames(jupiter_data) <- jupiter_col_names
  
  # Populate the intervals for Jupiter
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    jupiter_data[i, "INTERVAL"] <- 1
  }
  
  # Populate the Julian Days for Jupiter
  j <- 1L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    jupiter_data[i, "Julian_Day_Start"] <- vect[j]
    jupiter_data[i, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Jupiter subinterval 1
  k <- 339L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    for (j in seq(from = 3L, to = 26L, by = 1L)){
      jupiter_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Jupiter
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_jupiter.csv", sep = "")
  write.csv(jupiter_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for Saturn
  # Column names for Saturn, which has 7 coefficients for X, Y, and Z
  saturn_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                        "X1", "X2", "X3", "X4", "X5", "X6", "X7",
                        "Y1", "Y2", "Y3", "Y4", "Y5", "Y6", "Y7",
                        "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7")
  saturn_data = matrix(0.0,nrow=11415,ncol=24)
  colnames(saturn_data) <- saturn_col_names
  
  # Populate the intervals for Saturn
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    saturn_data[i, "INTERVAL"] <- 1
  }
  
  # Populate the Julian Days for Saturn
  j <- 1L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    saturn_data[i, "Julian_Day_Start"] <- vect[j]
    saturn_data[i, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Saturn subinterval 1
  k <- 363L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    for (j in seq(from = 3L, to = 23L, by = 1L)){
      saturn_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Saturn
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_saturn.csv", sep = "")
  write.csv(saturn_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for Uranus
  # Column names for Uranus, which has 6 coefficients for X, Y, and Z
  uranus_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                        "X1", "X2", "X3", "X4", "X5", "X6",
                        "Y1", "Y2", "Y3", "Y4", "Y5", "Y6",
                        "Z1", "Z2", "Z3", "Z4", "Z5", "Z6")
  uranus_data = matrix(0.0,nrow=11415,ncol=21)
  colnames(uranus_data) <- uranus_col_names
  
  # Populate the intervals for Uranus
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    uranus_data[i, "INTERVAL"] <- 1
  }
  
  # Populate the Julian Days for Uranus
  j <- 1L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    uranus_data[i, "Julian_Day_Start"] <- vect[j]
    uranus_data[i, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Uranus subinterval 1
  k <- 384L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    for (j in seq(from = 3L, to = 20L, by = 1L)){
      uranus_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Uranus
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_uranus.csv", sep = "")
  write.csv(uranus_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for Neptune
  # Column names for Neptune, which has 6 coefficients for X, Y, and Z
  neptune_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                        "X1", "X2", "X3", "X4", "X5", "X6",
                        "Y1", "Y2", "Y3", "Y4", "Y5", "Y6",
                        "Z1", "Z2", "Z3", "Z4", "Z5", "Z6")
  neptune_data = matrix(0.0,nrow=11415,ncol=21)
  colnames(neptune_data) <- neptune_col_names
  
  # Populate the intervals for Neptune
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    neptune_data[i, "INTERVAL"] <- 1
  }
  
  # Populate the Julian Days for Neptune
  j <- 1L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    neptune_data[i, "Julian_Day_Start"] <- vect[j]
    neptune_data[i, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Neptune subinterval 1
  k <- 402L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    for (j in seq(from = 3L, to = 20L, by = 1L)){
      neptune_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Neptune
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_neptune.csv", sep = "")
  write.csv(neptune_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for Pluto
  # Column names for Pluto, which has 6 coefficients for X, Y, and Z
  pluto_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                         "X1", "X2", "X3", "X4", "X5", "X6",
                         "Y1", "Y2", "Y3", "Y4", "Y5", "Y6",
                         "Z1", "Z2", "Z3", "Z4", "Z5", "Z6")
  pluto_data = matrix(0.0,nrow=11415,ncol=21)
  colnames(pluto_data) <- pluto_col_names
  
  # Populate the intervals for Pluto
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    pluto_data[i, "INTERVAL"] <- 1
  }
  
  # Populate the Julian Days for Pluto
  j <- 1L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    pluto_data[i, "Julian_Day_Start"] <- vect[j]
    pluto_data[i, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate Pluto subinterval 1
  k <- 420L
  for (i in seq(from = 1L, to = 11415, by = 1L)){
    for (j in seq(from = 3L, to = 20L, by = 1L)){
      pluto_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for Pluto
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_pluto.csv", sep = "")
  write.csv(pluto_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for the Moon
  # Column names for Moon, which has 13 coefficients for X, Y, and Z
  moon_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                      "X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9",
                      "X10", "X11", "X12", "X13", "Y1", "Y2", "Y3", "Y4",
                      "Y5", "Y6", "Y7", "Y8", "Y9", "Y10", "Y11", "Y12", "Y13",
                      "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7", "Z8",
                      "Z9", "Z10", "Z11", "Z12", "Z13")
  moon_data = matrix(0.0,nrow=91320,ncol=42)
  colnames(moon_data) <- moon_col_names
  
  # Populate the intervals for the Moon
  for (i in seq(from = 1L, to = 91320, by = 8L)){
    moon_data[i, "INTERVAL"] <- 1
    moon_data[i+1, "INTERVAL"] <- 2
    moon_data[i+2, "INTERVAL"] <- 3
    moon_data[i+3, "INTERVAL"] <- 4
    moon_data[i+4, "INTERVAL"] <- 5
    moon_data[i+5, "INTERVAL"] <- 6
    moon_data[i+6, "INTERVAL"] <- 7
    moon_data[i+7, "INTERVAL"] <- 8
  }
  
  # Populate the Julian Days for the Moon
  j <- 1L
  for (i in seq(from = 1L, to = 91320, by = 8L)){
    moon_data[i, "Julian_Day_Start"] <- vect[j]
    moon_data[i, "Julian_Day_End"] <- vect[j+1]
    moon_data[i+1, "Julian_Day_Start"] <- vect[j]
    moon_data[i+1, "Julian_Day_End"] <- vect[j+1]
    moon_data[i+2, "Julian_Day_Start"] <- vect[j]
    moon_data[i+2, "Julian_Day_End"] <- vect[j+1]
    moon_data[i+3, "Julian_Day_Start"] <- vect[j]
    moon_data[i+3, "Julian_Day_End"] <- vect[j+1]
    moon_data[i+4, "Julian_Day_Start"] <- vect[j]
    moon_data[i+4, "Julian_Day_End"] <- vect[j+1]
    moon_data[i+5, "Julian_Day_Start"] <- vect[j]
    moon_data[i+5, "Julian_Day_End"] <- vect[j+1]
    moon_data[i+6, "Julian_Day_Start"] <- vect[j]
    moon_data[i+6, "Julian_Day_End"] <- vect[j+1]
    moon_data[i+7, "Julian_Day_Start"] <- vect[j]
    moon_data[i+7, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate the Moon subinterval 1
  k <- 438L
  for (i in seq(from = 1L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Moon subinterval 2
  k <- 477L
  for (i in seq(from = 2L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Moon subinterval 3
  k <- 516L
  for (i in seq(from = 3L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Moon subinterval 4
  k <- 555L
  for (i in seq(from = 4L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Moon subinterval 5
  k <- 594L
  for (i in seq(from = 5L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Moon subinterval 6
  k <- 633L
  for (i in seq(from = 6L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Moon subinterval 7
  k <- 672L
  for (i in seq(from = 7L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Moon subinterval 8
  k <- 711L
  for (i in seq(from = 8L, to = 91320L, by = 8L)){
    for (j in seq(from = 3L, to = 41L, by = 1L)){
      moon_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for the Moon
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_moon.csv", sep = "")
  write.csv(moon_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for the Sun
  # Column names for Sun, which has 11 coefficients for X, Y, and Z
  sun_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                      "X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9",
                      "X10", "X11", "Y1", "Y2", "Y3", "Y4",
                      "Y5", "Y6", "Y7", "Y8", "Y9", "Y10", "Y11",
                      "Z1", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7", "Z8",
                      "Z9", "Z10", "Z11")
  sun_data = matrix(0.0,nrow=22830,ncol=36)
  colnames(sun_data) <- sun_col_names
  
  # Populate the intervals for the Sun
  for (i in seq(from = 1L, to = 22830, by = 2L)){
    sun_data[i, "INTERVAL"] <- 1
    sun_data[i+1, "INTERVAL"] <- 2
  }
  
  # Populate the Julian Days for the Sun
  j <- 1L
  for (i in seq(from = 1L, to = 22830, by = 2L)){
    sun_data[i, "Julian_Day_Start"] <- vect[j]
    sun_data[i, "Julian_Day_End"] <- vect[j+1]
    sun_data[i+1, "Julian_Day_Start"] <- vect[j]
    sun_data[i+1, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate the Sun subinterval 1
  k <- 750L
  for (i in seq(from = 1L, to = 22830, by = 2L)){
    for (j in seq(from = 3L, to = 35L, by = 1L)){
      sun_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Sun subinterval 2
  k <- 783L
  for (i in seq(from = 2L, to = 22830, by = 2L)){
    for (j in seq(from = 3L, to = 35L, by = 1L)){
      sun_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for the Sun
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_sun.csv", sep = "")
  write.csv(sun_data, here("data", "processed", new_filename), row.names = FALSE)
  
  # Extract data for the Nutations
  # Column names for Nutations, which has 11 coefficients for X, Y, and Z
  nutation_col_names <- c("Julian_Day_Start", "Julian_Day_End", "INTERVAL",
                     "Longitude1", "Longitude2", "Longitude3", "Longitude4",
                     "Longitude5", "Longitude6", "Longitude7", "Longitude8",
                     "Longitude9", "Longitude10", "Obliquity1", "Obliquity2",
                     "Obliquity3", "Obliquity4","Obliquity5", "Obliquity6",
                     "Obliquity7", "Obliquity8", "Obliquity9", "Obliquity10")
  nutation_data = matrix(0.0,nrow=45660,ncol=23)
  colnames(nutation_data) <- nutation_col_names
  
  # Populate the intervals for the Nutations
  for (i in seq(from = 1L, to = 45660, by = 4L)){
    nutation_data[i, "INTERVAL"] <- 1
    nutation_data[i+1, "INTERVAL"] <- 2
    nutation_data[i+2, "INTERVAL"] <- 3
    nutation_data[i+3, "INTERVAL"] <- 4
  }
  
  # Populate the Julian Days for the Nutations
  j <- 1L
  for (i in seq(from = 1L, to = 45660, by = 4L)){
    nutation_data[i, "Julian_Day_Start"] <- vect[j]
    nutation_data[i, "Julian_Day_End"] <- vect[j+1]
    nutation_data[i+1, "Julian_Day_Start"] <- vect[j]
    nutation_data[i+1, "Julian_Day_End"] <- vect[j+1]
    nutation_data[i+2, "Julian_Day_Start"] <- vect[j]
    nutation_data[i+2, "Julian_Day_End"] <- vect[j+1]
    nutation_data[i+3, "Julian_Day_Start"] <- vect[j]
    nutation_data[i+3, "Julian_Day_End"] <- vect[j+1]
    j <- j + 1020
  }
  
  # Populate the Nutations subinterval 1
  k <- 816L
  for (i in seq(from = 1L, to = 45660, by = 4L)){
    for (j in seq(from = 3L, to = 22L, by = 1L)){
      nutation_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Nutations subinterval 2
  k <- 836L
  for (i in seq(from = 2L, to = 45660, by = 4L)){
    for (j in seq(from = 3L, to = 22L, by = 1L)){
      nutation_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Nutations subinterval 3
  k <- 856L
  for (i in seq(from = 3L, to = 45660, by = 4L)){
    for (j in seq(from = 3L, to = 22L, by = 1L)){
      nutation_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Populate the Nutations subinterval 4
  k <- 876L
  for (i in seq(from = 4L, to = 45660, by = 4L)){
    for (j in seq(from = 3L, to = 22L, by = 1L)){
      nutation_data[i, j+1] <- vect[j+k]
    }
    k <- k + 1020L
  }
  
  # Write csv file for the Nutations
  new_filename <- substr(filename, 1, 9)
  new_filename <- paste(new_filename, "_nutation.csv", sep = "")
  write.csv(nutation_data, here("data", "processed", new_filename), row.names = FALSE)
  
}