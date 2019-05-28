library(dplyr)
library(ggplot2)
library(plotly)

#############################################################################################
####### In Washington, what counties have the least amount of access to healthy food? #######
#############################################################################################

healthy_wash <- read.csv("./data/prepped/healthy_wash.csv", stringsAsFactors = FALSE)
View(healthy_wash)

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
  # FF_Rest_2014              | Fast food restaurants in 2014                   | Count
  # --------------------------|-------------------------------------------------|--------------------------------
  # FS_Rest_2014              | Full service restaurants in 2014                | Count
  # --------------------------|-------------------------------------------------|--------------------------------
  # Dir_Sales_Farms_2012      | Farms with direct sales to consumers in 2012    | Count
  # --------------------------|-------------------------------------------------|--------------------------------
  # FMKT_SNAP_2016            | Farmers markets accepting SNAP in 2016          | Count
  # --------------------------|-------------------------------------------------|--------------------------------
  # FMKT_WIC_2016             | Farmers markets accepting WIC in 2016           | Count
  # --------------------------|-------------------------------------------------|--------------------------------
  # FMKT_WICCASH_2016         | Farmers markets accepting WIC Cash in 2016      | Count
  # --------------------------|-------------------------------------------------|--------------------------------
  # FMKT_SFMNP_2016           | Farmers markets accepting SFMNP in 2016         | Count


# Analysis
colnames(healthy_wash)






# Vis
healthy_wash_plot <- ggplot()