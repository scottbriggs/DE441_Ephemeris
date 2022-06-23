
# Create all the csv files for each body in the de441 data

create_body_jd_list <- function()
{
  create_mercury_jd_list()
  create_venus_jd_list()
  create_emb_jd_list()
  create_mars_jd_list()
  create_jupiter_jd_list()
  create_saturn_jd_list()
  create_uranus_jd_list()
  create_neptune_jd_list()
  create_pluto_jd_list()
  create_sun_jd_list()
  create_moon_jd_list()
  create_nutation_jd_list()
}