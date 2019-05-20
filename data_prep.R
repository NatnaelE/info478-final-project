library(dplyr)
library(readxl)

# xls files
county_estimates <- read_excel("./data/raw/DataDownload.xls", sheet = 3)
state_estimates <- read_excel("./data/raw/DataDownload.xls", sheet = 4)
access <- read_excel("./data/raw/DataDownload.xls", sheet = 5)
stores <- read_excel("./data/raw/DataDownload.xls", sheet = 6)
restaurants <- read_excel("./data/raw/DataDownload.xls", sheet = 7)
assistance <- read_excel("./data/raw/DataDownload.xls", sheet = 8)
insecurity <- read_excel("./data/raw/DataDownload.xls", sheet = 9)
prices_taxes <- read_excel("./data/raw/DataDownload.xls", sheet = 10)
local <- read_excel("./data/raw/DataDownload.xls", sheet = 11)
health <- read_excel("./data/raw/DataDownload.xls", sheet = 12)
socioeconomic <- read_excel("./data/raw/DataDownload.xls", sheet = 13)

# Manipulate individual dataframes as necessary (remove as many unneeded columns as possible)
# Documentation: https://www.ers.usda.gov/data-products/food-environment-atlas/documentation/#health





# Example csv output:
# write.csv(state_estimates, "./data/prepped/state_estimates.csv")
