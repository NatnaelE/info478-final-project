library(dplyr)
library(DataCombine)

#############################################################################################
####### In Washington, what counties have the least amount of access to healthy food? #######
#############################################################################################

healthy_wash <- read.csv("./data/prepped/healthy_wash.csv", stringsAsFactors = FALSE)
colnames(healthy_wash) <- c("fips", "state", "county", "Pop_2015", "FF_Rest_2014", "FS_Rest_2014", 
                            "Dir_Sales_Farms_2012", "FMKT_SNAP_2016", "FMKT_WIC_2016", "FMKT_WICCASH_2016",
                            "FMKT_SFMNP_2016")
# View(healthy_wash)

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

# Proportion of fast food to full service reseaurants
  # FF/FS = indicator of healthiness of options (higher number is less healthy, lower number is more healthy)
fast_v_full <- data.frame("fips" = c(1), "state"=c(1), "county" = c(1), "proportion" = c(1))
for (i in 1:nrow(healthy_wash)) {
  row <- healthy_wash[i,c("fips", "state", "county", "FF_Rest_2014", "FS_Rest_2014")]
  prop <- round(row$FF_Rest_2014 / row$FS_Rest_2014, digits=2)
  ret <- c(row$fips, row$state, row$county, prop)
  fast_v_full <- InsertRow(fast_v_full, ret)
}
fast_v_full <- fast_v_full[2:40,]


# Proportion of SNAP/WIC/WICCASH/SFMNP markets per person 
  # Pop/market_type
  # Replace Inf values with Pop size
market_analysis <- function(columnName) {
  data <- healthy_wash[,c("fips", "state", "county", "Pop_2015", columnName)]
  ret <- data.frame("fips" = c(1), "state" = c(1), "county" = c(1), "proportion" = c(1))
  for (i in 1:nrow(data)) {
    row <- data[i,]
    prop <- row$Pop_2015 / row[columnName]
    if (prop == "Inf") {
      prop <- row$Pop_2015
    } else {
      prop <- prop[[columnName]]
    }
    toInsert <- c(row$fips, row$state, row$county, prop)
    ret <- InsertRow(ret, toInsert)
  }
  return(ret[2:40,])
}

snap <- market_analysis("FMKT_SNAP_2016")
wic <- market_analysis("FMKT_WIC_2016")
wiccash <- market_analysis("FMKT_WICCASH_2016")
sfmnp <- market_analysis("FMKT_SFMNP_2016")


plot_data <- data.frame("fips" = fast_v_full$fips, "state" = fast_v_full$state, "county" = fast_v_full$county,
                        "fast_food" = fast_v_full$proportion, "snap" = snap$proportion, "wic" = wic$proportion,
                        "wiccash" = wiccash$proportion, "sfmnp" = sfmnp$proportion)
# View(plot_data)


# Vis
# fast_map <- plot_usmap(data=plot_data, values="fast_food", regions="counties", 
#                        include=fast_v_full$fips, aes(label=county, label2=fast_food)) +
#             theme(legend.position = "none",
#                   axis.title.x = element_blank(),
#                   axis.ticks.x = element_blank(),
#                   axis.text.x = element_blank(),
#                   axis.title.y = element_blank(),
#                   axis.ticks.y = element_blank(),
#                   axis.text.y = element_blank())

# ggplotly(fast_map, tooltip = c("label", "label2"))





