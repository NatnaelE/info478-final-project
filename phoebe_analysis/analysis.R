library(dplyr)
library(readxl)
library(ggplot2)


prices_taxes <- read_excel("./data/raw/DataDownload.xls", sheet = 10)

soda_tax_top15 <- prices_taxes %>% 
                  group_by(State) %>% 
                  summarise(avg_soda_tax = mean(SODATAX_STORES14)) %>% 
                  top_n(15, wt = avg_soda_tax) 

milk_price_top15 <- prices_taxes %>% 
                    group_by(State) %>% 
                    summarise(avg_milk_price = mean(MILK_PRICE10)) %>% 
                    top_n(15, wt = avg_milk_price)

soda_tax <- ggplot(data = soda_tax_top15, mapping = aes(x = State, y = avg_soda_tax)) +
            geom_bar(position="dodge", stat="identity") + 
            labs(
              x = "State",
              y = "Average Soda Tax",
              title = "Top 15 States with the highest Soda tax"
            )

ggsave(filename = "soda.png", plot = last_plot(), path = "phoebe_analysis")

milk_price <- ggplot(data = milk_price_top15, mapping = aes(x = State, y = avg_milk_price)) +
              geom_bar(position="dodge", stat="identity") + 
              labs(
                x = "State",
                y = "Average Milk Price",
                title = "Top 15 States with the highest milk price"
              )
        
ggsave(filename = "milk_price.png", plot = last_plot(),  path = "phoebe_analysis")



