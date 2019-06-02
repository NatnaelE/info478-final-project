library(dplyr)
library(ggplot2)
library(plotly)
library(readxl)
library(plotly)
library(usmap)
library(choroplethr)
library(choroplethrMaps)
#########################################################################
######### Is adult obesity rate linked to socioeconomic status? ######### 
#########################################################################
setwd("C:/Users/natna/Desktop/info478-final-project")
sociobesity <- read.csv("data/prepped/sociobesity.csv", stringsAsFactors = FALSE)

obese_full <- read_excel("data/raw/DataDownload.xls", sheet = 12)
obese_full <- obese_full %>% select(County, State, PCT_OBESE_ADULTS13)

work_data <- left_join(sociobesity, obese_full) %>%  na.omit()
colnames(work_data)[colnames(work_data)=="FIPS"] <- "fips"
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
#PART 1 - CORRELATION AT THE STATE LEVEL
state_data <- work_data %>% group_by(State) %>% 
  summarise(average_poverty = mean(Pov_Rate_2015),
            average_obesity = mean(PCT_OBESE_ADULTS13)) %>% na.omit()

state_level_correlation_plot <- ggplot(state_data, aes(x=average_poverty, y=average_obesity)) +
                        geom_point(shape=1) +    # Use hollow circles
                        geom_smooth(method=lm)

state_level_correlation <- cor(state_data$average_poverty, state_data$average_obesity)

#PART 2 - CORRELATION AT THE COUNTY LEVEL
county_level_correlation_plot <- ggplot(work_data, aes(x=Pov_Rate_2015, y=PCT_OBESE_ADULTS13)) +
                            geom_point(shape=1) +    # Use hollow circles
                            geom_smooth(method=lm)

county_level_correlation <- cor(work_data$Pov_Rate_2015, work_data$PCT_OBESE_ADULTS13)

#PART 3 - COMPARING BOTH SIDES OF THE SPECTRUM 
highest_poverty <- work_data %>% arrange(-Pov_Rate_2015) %>% head(10) %>% select(State, County, Pov_Rate_2015, PCT_OBESE_ADULTS13)

lowest_poverty <- work_data %>% arrange(Pov_Rate_2015) %>% head(10) %>% select(State, County, Pov_Rate_2015, PCT_OBESE_ADULTS13)

#PART 4 - POSSIBLE OTHER CAUSES
income_correlation_plot <-ggplot(work_data, aes(x=Med_HH_Income_2015, y=PCT_OBESE_ADULTS13)) +
                           geom_point(shape=1) +    # Use hollow circles
                            geom_smooth(method=lm)

income_correlation <- cor(work_data$Med_HH_Income_2015, work_data$PCT_OBESE_ADULTS13)




# Vis
county_obesity_plot <- plot_usmap(data=work_data, values="PCT_OBESE_ADULTS13", regions="counties",
                        include=work_data$fips, aes(label=County, label2=PCT_OBESE_ADULTS13)) +
             theme(legend.position = "none",
                   axis.title.x = element_blank(),
                   axis.ticks.x = element_blank(),
                   axis.text.x = element_blank(),
                   axis.title.y = element_blank(),
                   axis.ticks.y = element_blank(),
                   axis.text.y = element_blank()) +
  scale_fill_continuous(low = "blue", high = "yellow", guide = FALSE)

 ggplotly(county_obesity_plot, tooltip = c("County", "PCT_OBESE_ADULTS13"))
