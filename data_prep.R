library(dplyr)
library(readxl)

# xls files
county <- read_excel("./data/raw/DataDownload.xls", sheet = 3)
state <- read_excel("./data/raw/DataDownload.xls", sheet = 4)
access <- read_excel("./data/raw/DataDownload.xls", sheet = 5)
restaurants <- read_excel("./data/raw/DataDownload.xls", sheet = 7)
insecurity <- read_excel("./data/raw/DataDownload.xls", sheet = 9)
local <- read_excel("./data/raw/DataDownload.xls", sheet = 11)
health <- read_excel("./data/raw/DataDownload.xls", sheet = 12)
socioeconomic <- read_excel("./data/raw/DataDownload.xls", sheet = 13)

# Manipulate individual dataframes as necessary (remove as many unneeded columns as possible)
# Documentation: https://www.ers.usda.gov/data-products/food-environment-atlas/documentation/#health
county <- county[, c("FIPS", "State", "County", "Population Estimate, 2015")]
county$`Population Estimate, 2015` <- as.numeric(gsub(",","",county$`Population Estimate, 2015`))
county$FIPS <- as.numeric(gsub(",","",county$FIPS))
state <- state[, c("StateFIPS", "State", "WIC participants, FY 2015", 
                   "National School Lunch Program participants, FY 2015",
                   "School Breakfast Program participants, FY 2015",
                   "Child and Adult Care participants, FY 2015", 
                   "Summer Food participants, FY 2015", "State Population,  2015")]


# socio-obesity csv
  # county, socioeconomic, health
socioeconomic <- socioeconomic[, c("FIPS", "State", "County", "MEDHHINC15", "POVRATE15",
                                   "CHILDPOVRATE15")]
health <- health[, c("FIPS", "State", "County", "PCT_OBESE_ADULTS13")]
sociobesity <- merge(county, socioeconomic, by=c("FIPS")) %>% 
  merge(health, by="FIPS")
sociobesity <- sociobesity[, c("FIPS", "State", "County", "Population Estimate, 2015", "MEDHHINC15", 
                                 "POVRATE15", "CHILDPOVRATE15")] 
colnames(sociobesity) <- c("FIPS", "State", "County", "Pop_2015", "Med_HH_Income_2015",
                           "Pov_Rate_2015", "Child_Pov_Rate_2015")
write.csv(sociobesity, "./data/prepped/sociobesity.csv", row.names = FALSE)



# age-insecurity csv
  # county, insecurity, access
insecurity <- insecurity[, c("FIPS", "State", "County", "FOODINSEC_13_15", "CH_FOODINSEC_12_15")]
access <- access[, c("FIPS", "State", "County", "LACCESS_POP15", "PCT_LACCESS_POP15", "LACCESS_CHILD15", "PCT_LACCESS_CHILD15",
                     "LACCESS_SENIORS15", "PCT_LACCESS_SENIORS15")]
age_insecurity <- merge(county, insecurity, by="FIPS") %>%
  merge(access, by="FIPS")
age_insecurity <- age_insecurity[, c("FIPS", "State", "County", "Population Estimate, 2015",
                                     "FOODINSEC_13_15", "CH_FOODINSEC_12_15", "LACCESS_POP15", "PCT_LACCESS_POP15",
                                     "LACCESS_CHILD15", "PCT_LACCESS_CHILD15", "LACCESS_SENIORS15", "PCT_LACCESS_SENIORS15")]
colnames(age_insecurity) <- c("FIPS", "State", "County", "Pop_2015",
                              "State_Food_Insec_15", "State_Child_Food_Insec_15", "Pop_Low_Access_2015", "Pop_Low_Acc_Pct_2015",
                              "Child_Low_Access_2015", "Child_Low_Acc_Pct_2015", "Senior_Low_Access_2015", "Senior_Low_Acc_Pct_2015")
write.csv(age_insecurity, "./data/prepped/age_insecurity.csv", row.names = FALSE)



# Washington counties healthy food access csv
  # county, restaurants, local
county <- county[county$State == "Washington",]
restaurants <- restaurants[restaurants$State == "WA", c("FIPS", "State", "County", "FFR14", "FSR14")]
local <- local[local$State == "WA", c("FIPS", "State", "County", "DIRSALES_FARMS12", "FMRKT_SNAP16", 
                   "FMRKT_WIC16", "FMRKT_WICCASH16", "FMRKT_SFMNP16")]
healthy_wash <- merge(county, restaurants, by="FIPS") %>%
  merge(local, by="FIPS")
healthy_wash <- healthy_wash[, c("FIPS", "State", "County", "Population Estimate, 2015",
                                 "FFR14", "FSR14", "DIRSALES_FARMS12", "FMRKT_SNAP16", "FMRKT_WIC16",
                                 "FMRKT_WICCASH16", "FMRKT_SFMNP16")]
colnames(healthy_wash) <- c("FIPS", "State", "County", "Pop_2015",
                            "FF_Rest_2014", "FS_Rest_2014", "Dir_Sales_Farms_2012", "FMKT_SNAP_2016", "FMKT_WIC_2016",
                            "FMKT_WICCASH_2016", "FMKT_SFMNP_2016")
healthy_wash[is.na(healthy_wash)] <- 0
write.csv(healthy_wash, "./data/prepped/healthy_wash.csv", row.names = FALSE)
