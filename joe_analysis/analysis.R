library(dplyr)
library(ggplot2)
library(usmap)

insec <- read.csv("./data/prepped/insecurity.csv")
insec.s <- insec %>% group_by(State) %>% 
  summarize(
    FI_10_12 = mean(FOODINSEC_10_12),
    FI_13_15 = mean(FOODINSEC_13_15),
    CH_FI_12_15 = mean(CH_FOODINSEC_12_15),
    VLFS_10_12 = mean(VLFOODSEC_10_12),
    VLFS_13_15 = mean(VLFOODSEC_13_15),
    CH_VL_12_15 = mean(CH_VLFOODSEC_12_15),
    FI_CH_01_07 = mean(FOODINSEC_CHILD_01_07),
    FI_CH_03_11 = mean(FOODINSEC_CHILD_03_11)
  ) %>% mutate(
    CH_FI_CH_07_11 = FI_CH_03_11 - FI_CH_01_07,
    fips = fips(State)
  )
    
FI_13_15_plot <- plot_usmap(data=insec.s, values="FI_13_15", lines="black") +
  labs(title="Household Food Insecurity 2013-2015") +
  scale_fill_continuous(low="white", high="red", name = "Avg. Percent %") +
  theme(legend.position = "right")

CH_FI_plot <- plot_usmap(data=insec.s, values="CH_FI_12_15", lines="black") +
  labs(title="Change in Household Food Insecurity between 2012 and 2015") +
  scale_fill_continuous(low="green", high="red", name = "Percent Change %") +
  theme(legend.position = "right")

CH_VL_plot <- plot_usmap(data=insec.s, values="CH_VL_12_15", lines="black") +
  labs(title="Change in Very Low Household Food Insecurity between 2012 and 2015") +
  scale_fill_continuous(low="green", high="red", name = "Percent Change %") +
  theme(legend.position = "right")

CH_FI_CH_plot <- plot_usmap(data=insec.s, values="CH_FI_CH_07_11", lines="black") +
  labs(title="Change in Households with Child Food Insecurity between 2007 and 2011") +
  scale_fill_continuous(low="green", high="red", name = "Percent Change %") +
  theme(legend.position = "right")


plot(FI_13_15_plot)
plot(CH_FI_plot)
plot(CH_VL_plot)
plot(CH_FI_CH_plot)