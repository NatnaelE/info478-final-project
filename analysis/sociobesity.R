library(dplyr)
library(ggplot2)
library(plotly)

#########################################################################
######### Is adult obesity rate linked to socioeconomic status? ######### 
#########################################################################
setwd("C:/Users/natna/Desktop/info478-final-project")
sociobesity <- read.csv("data/prepped/sociobesity.csv", stringsAsFactors = FALSE)


# Column Variables:
  # Name                | Desc.                                           | Datatype/Unit of Measurement
  # --------------------|-------------------------------------------------|--------------------------------
  # FIPS                | County-unique identifier                        | String
  # --------------------|-------------------------------------------------|--------------------------------
  # State               | Name of state, either in full-name or abbrev.   | String
  # --------------------|-------------------------------------------------|--------------------------------
  # County              | Name of county                                  | String
  # --------------------|-------------------------------------------------|--------------------------------
  # Pop_2015            | Estimated population size in 2015               | Integer
  # --------------------|-------------------------------------------------|--------------------------------
  # Med_HH_Income_2015  | Median household income in 2015                 | Integer in dollars
  # --------------------|-------------------------------------------------|--------------------------------
  # Pov_Rate_2015       | Poverty rate in 2015                            | Population percentage
  # --------------------|-------------------------------------------------|--------------------------------
  # Child_Pov_Rate_2015 | Child poverty rate in 2015                      | Sub-percent of Pov_Rate_2015


# Analysis
colnames(sociobesity)






# Vis
sociobesity_plot <- ggplot()
