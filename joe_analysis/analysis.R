library(dplyr)
library(ggplot2)
library(usmap)

insec <- read.csv("./data/prepped/insecurity.csv")
insec <- insec %>% group_by(State) %>% 
  summarize(
    FI_10_12 = mean(FOODINSEC_10_12),
    FI_13_15 = mean(FOODINSEC_13_15),
    CH_FI_12_15 = mean(CH_FOODINSEC_12_15),
    VLFS_10_12 = mean(VLFOODSEC_10_12),
    VLFS_13_15 = mean(VLFOODSEC_13_15),
    
  )
    