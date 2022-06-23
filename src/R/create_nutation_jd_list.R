
# Create file for the Nutation data that can be queried for the julian date of interest

create_nutation_jd_list <- function()
{
  filename <- "ascm01000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df <- data.frame(jd_begin, jd_end, filename)
  
  filename <- "ascm02000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm03000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm04000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm05000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm06000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm07000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm08000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm09000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm10000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm11000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm12000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp00000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp01000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp02000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp03000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp04000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp05000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp06000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp07000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp08000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp09000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp10000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp11000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp12000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp13000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp14000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp15000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp16000_nutation.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  # Write csv file
  write.csv(df, here("data", "processed", "nutation.csv"), row.names = TRUE)
  
}
