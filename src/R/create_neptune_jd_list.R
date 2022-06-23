
# Create file for the Neptune data that can be queried for the julian date of interest

create_neptune_jd_list <- function()
{
  filename <- "ascm01000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df <- data.frame(jd_begin, jd_end, filename)
  
  filename <- "ascm02000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm03000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm04000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm05000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm06000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm07000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm08000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm09000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm10000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm11000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascm12000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp00000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp01000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp02000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp03000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp04000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp05000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp06000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp07000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp08000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp09000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp10000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp11000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp12000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp13000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp14000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp15000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  filename <- "ascp16000_neptune.csv"
  csv1 <- import(filename)
  csv1 <- na.omit(csv1)
  num_rows <- nrow(csv1)
  jd_begin <- csv1[1,1]
  jd_end <- csv1[num_rows,1]
  df[nrow(df) + 1,] <- c(jd_begin, jd_end, filename)
  
  # Write csv file
  write.csv(df, here("data", "processed", "neptune.csv"), row.names = TRUE)
  
}
