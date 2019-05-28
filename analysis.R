library(dplyr)
library(ggplot2)
library(plotly)

sociobesity <- read.csv("./data/prepped/sociobesity.csv", stringsAsFactors = FALSE)
age_insecurity <- read.csv("./data/prepped/age_insecurity.csv", stringsAsFactors = FALSE)
healthy_wash <- read.csv("./data/prepped/healthy_wash.csv", stringsAsFactors = FALSE)
# View(sociobesity)
# View(age_insecurity)
# View(healthy_wash)

# Global CSV Features:
  # Name                | Desc.                                           | Datatype/Unit of Measurement
  # --------------------|-------------------------------------------------|--------------------------------
  # FIPS                | County-unique identifier                        | String
  # --------------------|-------------------------------------------------|--------------------------------
  # State               | Name of state, either in full-name or abbrev.   | String
  # --------------------|-------------------------------------------------|--------------------------------
  # County              | Name of county                                  | String
  # --------------------|-------------------------------------------------|--------------------------------
  # Pop_2015            | Estimated population size in 2015               | Character


##############################
########## Analysis ##########
##############################

##### Is adult obesity rate linked to socioeconomic status?
# Analysis
  # Column Variables:
    # Name                | Desc.                                           | Datatype/Unit of Measurement
    # --------------------|-------------------------------------------------|--------------------------------
    # Med_HH_Income_2015  | Median household income in 2015                 | Number in dollars
    # --------------------|-------------------------------------------------|--------------------------------
    # Pov_Rate_2015       | Poverty rate in 2015                            | Population percentage
    # --------------------|-------------------------------------------------|--------------------------------
    # Child_Pov_Rate_2015 | Child poverty rate in 2015                      | Sub-percent of Pov_Rate_2015
colnames(sociobesity)

# Vis 
sociobesity_plot <- ggplot()


##### Does food insecurity vary by age?
# Analysis
  # Column Variables:
    # Name                      | Desc.                                           | Datatype/Unit of Measurement
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
colnames(age_insecurity)

# Vis
age_insec_plot <- ggplot()



##### In Washington, what counties have the least amount of access to healthy food?
# Analysis
  # Column Variables:
    # Name                      | Desc.                                           | Datatype/Unit of Measurement
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
colnames(healthy_wash)

# Vis
healthy_wash_plot <- ggplot()

