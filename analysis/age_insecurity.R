library(dplyr)
library(ggplot2)
library(plotly)

#################################################
####### Does food insecurity vary by age? #######
#################################################

age_insecurity <- read.csv("./data/prepped/age_insecurity.csv", stringsAsFactors = FALSE)
View(age_insecurity)

# Column Variables:
  # Name                      | Desc.                                           | Datatype/Unit of Measurement
  # --------------------------|-------------------------------------------------|--------------------------------
  # FIPS                      | County-unique identifier                        | String
  # --------------------------|-------------------------------------------------|--------------------------------
  # State                     | Name of state, either in full-name or abbrev.   | String
  # --------------------------|-------------------------------------------------|--------------------------------
  # County                    | Name of county                                  | String
  # --------------------------|-------------------------------------------------|--------------------------------
  # Pop_2015                  | Estimated population size in 2015               | Integer
  # --------------------------|-------------------------------------------------|--------------------------------
  # State_Food_Insec_15       | State-wide household food insecurity in 2015    | Population percentage
  # --------------------------|-------------------------------------------------|--------------------------------
  # State_Child_Food_Insec_15 | State-wide child food insecurity in 2015        | sub-percent of State_Food_Insec_2015
  # --------------------------|-------------------------------------------------|--------------------------------
  # Pop_Low_Access_2015       | Population w/low access to store in 2015        | Count of individuals
  # --------------------------|-------------------------------------------------|--------------------------------
  # Child_Low_Access_2015     | Children w/low access to store in 2015          | Count of children
  # --------------------------|-------------------------------------------------|--------------------------------
  # Senior_Low_Access_2015    | Seniors w/low access to store in 2015           | Count of seniors


# Analysis
colnames(age_insecurity)






# Vis
age_insec_plot <- ggplot()


