% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid_diversity.R
\name{grid_diversity}
\alias{grid_diversity}
\title{Function to grid geolocated, taxonomically-defined observations on a map}
\usage{
grid_diversity(mydata, taxonomic_level, myresolution = 0.5, myzoom = 7,
  lat_centre = NULL, lon_centre = NULL)
}
\arguments{
\item{mydata}{is an R data.frame. It must contain at least two columns containing latitudes and
longitudes for each observation. \code{grid_diversity} will attempt to find in mydata the columns 
that contain that information. Column names must contain the letters "lat" and "lon".}

\item{taxonomic_level}{is the taxonomic resolution for gridding. Possible choices are
kingdom, phylum, class, order, family, genus and species}

\item{myresolution}{is the size of the cells the data is to be aggregated over}

\item{myzoom}{is the zoom to be applied to plot the gridded data on ggmap map}

\item{lat_centre}{is the user-defined latitude the map will be centred on. Default to mean 
latitude of observations.}

\item{lon_centre}{is the user-defined longitude the map will be centred on. Default to mean 
longitude of observations.}
}
\value{
\code{grid_diversity} returns a data frame containing the number of unique 
taxonomic group per cell. The taxonomic resolution is defined by the user.
}
\description{
Data portals such as OBIS typically return tables of geolocated observations upon requests.
When combined with packages such as taxizesoap the taxonomy of all occurring species
can be added. From there a common task is to map the number of unique species/genus/family (or
other taxonomic group) on a lattice.
}
\examples{
library(robis)
library(ggmap)
mydata <- occurrence(geometry = "POLYGON ((0 0, 0 45, 45 45, 45 0, 0 0))", year = 1975)
grid_diversity(mydata, taxonomic_level = "genus", myresolution = 2, myzoom = 3)
head(justchecking$gridded_data)
# plot the data
justchecking$myplot 
}

