library(dplyr)
library(ggplot2)
library(tidyr)
setwd("C:/Users/natna/Desktop/info478-final-project")
data <- read.csv("data/prepped/state_estimates.csv", stringsAsFactors = FALSE)

plot_data <- data %>% select(State, WIC.participants..FY.2015,
                             National.School.Lunch.Program.participants..FY.2015,
                             School.Breakfast.Program.participants..FY.2015,
                             Child.and.Adult.Care.participants..FY.2015,
                             Summer.Food.participants..FY.2015,
                             State.Population...2015)

colnames(plot_data) <- c("State", "WIC2015", "Nat_Lunch2015", "Scho_Break2015",
                         "Child_adult_care2015", "Summ_food2015", "State_pop")

plot_data <- plot_data %>% 
              mutate(perc_WIC2015 = (WIC2015 / State_pop) * 100,
                     perc_Nat_Lunch2015 = (Nat_Lunch2015 / State_pop) * 100,
                     perc_Scho_Break2015 = (Scho_Break2015 / State_pop) * 100,
                     perc_Child_adult_care2015 = (Child_adult_care2015 / State_pop) * 100,
                     perc_Summ_food2015 = (Summ_food2015 / State_pop) * 100) %>% 
              select(State,perc_WIC2015,perc_Nat_Lunch2015,perc_Scho_Break2015,perc_Child_adult_care2015,
                     perc_Summ_food2015) 

plot_data <- plot_data %>% na.omit()

plot_data_long <- gather(plot_data,
                     key = indicator,
                     value = percentage,
                     -State)

grouped_perc_plot <- ggplot(plot_data_long, aes(fill=indicator, y=percentage, x=State)) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(
    x = "Percentage of State Population",
    y = "State",
    title = "Percentage of State Population Participating In Food Assistance Programs (2015)",
    fill = "Indicator"
  ) +
  scale_fill_discrete(labels = c("Child and Adult Care Food Program",
                                 "National School Lunch Program",
                                 "School Breakfast Program participants",
                                 "Summer Food Service Program",
                                 "WIC Program"))

grouped_perc_plot
