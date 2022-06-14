
# Process all the JPL DE441 ascii files and convert to csv files for each body

process_de441_data <- function()
{
  load_de441_ascii_data(here("data", "raw", "ascm02000.441"))
}