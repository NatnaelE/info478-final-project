library(dplyr)
library(ggplot2)
library(plotly)

#################################################
####### Does food insecurity vary by age? #######
#################################################

age_insec <- read.csv("../data/prepped/age_insecurity.csv", stringsAsFactors = FALSE) %>% na.omit()
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


# Pop_Low_Access--- Definition: Number of people in a county living more than 1 mile from a supermarket or large grocery store 
# if in an urban area, or more than 10 miles from a supermarket or large grocery store if in a rural area.

# Child_Low_Access--- Definition: Number of children (age < 18) in a county living more than 1 mile from a supermarket or large 
# grocery store if in an urban area, or more than 10 miles from a supermarket or large grocery store if in a rural area.

# Senior_Low_Access--- Definition: Number of seniors (age > 64) in a county living more than 1 mile from a supermarket or large 
# grocery store if in an urban area, or more than 10 miles from a supermarket or large grocery store if in a rural area.



# Analysis

# state_data <- age_insec %>% group_by(State) %>% 
#   summarise(average_poverty = mean(Pov_Rate_2015),
#             average_obesity = mean(Percent_Of_Obese_Adults)) %>% na.omit()
proof_plot <- ggplot(age_insec, aes(x=State_Food_Insec_15, y=State_Child_Food_Insec_15)) +
  geom_point(shape=1) +
  geom_smooth(method=lm) +
  labs(title = "State-wide Household Food Insecurity Vs. State-wide Child Food Insecurity in 2015",
       x = "Household Food Insecurity %",
       y = "Child Food Insecurity %")

lowest_access <- age_insec %>% arrange(-Pop_Low_Acc_Pct_2015) %>% head(7) %>% select(State, County, Pop_Low_Acc_Pct_2015, Pop_2015, Pop_Low_Access_2015)

low_child_access <- age_insec %>% arrange(-Child_Low_Acc_Pct_2015) %>% head(7) %>% select(State, County, Child_Low_Acc_Pct_2015, Pop_2015, Child_Low_Access_2015)

low_senior_access <- age_insec %>% arrange(-Senior_Low_Acc_Pct_2015) %>% head(7) %>% select(State, County, Senior_Low_Acc_Pct_2015, Pop_2015, Senior_Low_Access_2015)

pop_la_mean <- mean(age_insec$Pop_Low_Acc_Pct_2015)

child_la_mean <- mean(age_insec$Child_Low_Acc_Pct_2015)

senior_la_mean <- mean(age_insec$Senior_Low_Acc_Pct_2015)

pop_child_plot <- ggplot(age_insec, aes(x=Pop_Low_Acc_Pct_2015, y=Child_Low_Acc_Pct_2015)) +
  geom_point(shape=1) +
  geom_smooth(method=lm) +
  labs(title = "Population with Low Access to Store Vs. Children with Low Access to Store in 2015",
       x = "Population Low Access %",
       y = "Child Low Access %")

pop_senior_plot <- ggplot(age_insec, aes(x=Pop_Low_Acc_Pct_2015, y=Senior_Low_Acc_Pct_2015)) +
  geom_point(shape=1) +
  geom_smooth(method=lm) +
  labs(title = "Population with Low Access to Store Vs. Seniors with Low Access to Store in 2015",
       x = "Population Low Access %",
       y = "Senior Low Access %")

# Vis
#age_insec_plot <- ggplot()


