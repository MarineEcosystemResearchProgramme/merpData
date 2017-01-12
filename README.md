merpData
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

##### Functions to access, visualise and combine marine data

merpData provides R functions to manipulate marine data, as well as examples of workflow specifically applied to UK resources. Currently functionalities include mapping, spatial and/or temporal matching of multiple data sources and wrappers for marine webservices. A development version is also available where new functions are being openly created.

Installation
------------

merpData can be installed from github using the install\_github function from the devtools package:

``` r
library(devtools)
devtools::install_github(repo = "MarineEcosystemResearchProgramme/merpData")
library(merpData)
```

Usage
-----

Below is the list of available functions:
+ grid\_data
+ grid\_diversity

Each function has a help file which can be accessed in R by typing ? followed by the name of the function.

The Rmerp package is very much intended to be used alongside existing packages, notably robis, taxizesoap and mregions (for data enrichment) as well as ggplot2, ggmap and ggvis (for mapping and visualisation).
