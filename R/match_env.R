#' Match biotic and abiotic data in space and time
#'
#' The function takes two sets of geolocated, temporally resolved
#' data (typically one biotic and one abiotic) and match them.
#'
#' \code{match_env} returns the value of the environmental variable
#' for the time and location in the abiotic set of coordinates that
#' are closest to that of the biotic record. If the vector of values for 
#' the abiotic variable is not provided, the function simply returns the
#' index of the closest location in the vector of coordinates. Temporal
#' matching is done on a "year-month" basis. If there is no temporal
#' match the function returns NA. Similarly if there is no matching data within
#' a threshold distance (optional), the function returns NA. Geographical
#' distance is calculating using the geosphere::distm() function using
#' the haversine method (i.e. assuming a spherical earth, ignoring ellipsoidal effects). 
#' 
#' @param env_lon is a vector of longitudes for the abiotic variable
#' @param env_lat is a vector of latitude for the abiotic variable
#' @param env_time is a list containing vectors "year" and "month" 
#' for the abiotic variables
#' @param bio_lon is the longitude of the observed biotic record
#' @param bio_lat is the latitude of the observed biotic record
#' @param bio_time is a list containing the year and month at which the
#' biotic record was observed
#' @param max_dist is the maximum distance (in km) beyond which
#' a environmental data point is considered too far to inform conditions
#' at location of biological records
#' @param env_variable is an optional vector containing abiotic variable values
#' 
#' 
match_env <- function(env_lon, env_lat, env_time = c(year = NULL, month = NULL), bio_lon , bio_lat, bio_time = 
                        c(year = NULL, month = NULL), max_dist = NA, env_variable = NULL){
  idx <- which(bio_time[["year"]] == env_time[["year"]] & bio_time[["month"]] == env_time[["month"]])
  res <- NA
  if(length(idx) != 0){
    env_lon <- env_lon[idx]
    env_lat <- env_lat[idx]
    alldist <- sapply(c(1:length(env_lon)), function(i) distm(c(env_lon[i], env_lat[i]), c(bio_lon, bio_lat)))
    res <- ifelse(!is.null(env_variable), env_variable[idx[which.min(alldist)]], idx[which.min(alldist)])
    if(!is.na(max_dist) & res > max_dist) res <- NA
    }
  res
}
