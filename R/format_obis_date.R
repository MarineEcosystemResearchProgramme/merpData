#' Extract separate year, month and day information from obis data
#'
#' The function takes an OBIS occurrence data set and
#' uses its eventDate columns to extract year, month
#' and day information.
#'
#' \code{format_obis_date} formats the "eventDate" column
#' in the data frame returned by robis::occurrence function.
#' The eventDate entry is of the form yyyy-mm-dd hh:mm:ss,
#' a format that needs splitting into year, month and day
#' information to be useful. 
#' 
#' @param obis_data is a data.frame of OBIS occurrence data 
#' obtained using robis::occurrence or merpWS::plot_obis
#' 
#' 
format_obis_date <- function(obis_data){
  inter <- strsplit(as.character(obis_data$eventDate), split = " ") %>%
    sapply(., function(x) x[[1]]) %>%
    strsplit(., split = "-") 
  obis_data$year <- as.numeric(sapply(inter, function(x) x[1]))
  obis_data$month <- as.numeric(sapply(inter, function(x) x[2]))
  obis_data$day <- as.numeric(sapply(inter, function(x) x[3]))
  obis_data
}
