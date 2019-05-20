library(dplyr)
library(usmap)
library(ggplot2)

state <- read.csv("./data/prepped/state_estimates.csv")
state <- state[1:51,c("State", "WIC.participants.FY.2009", "WIC.participants.FY.2011", 
                  "WIC.participants..FY.2012", "WIC.participants..FY.2013", "WIC.participants..FY.2014",
                  "WIC.participants..FY.2015")]
colnames(state) <- c("state", "WIC2009", "WIC2011", "WIC2012", "WIC2013", "WIC2014", "WIC2015")
# View(state)


wic09_plot <- plot_usmap(data=state, values="WIC2009", lines="white") +
  labs(title="WIC Participants 2009") +
  scale_fill_continuous(low="white", high="blue", name = "Num. Participants", label = scales::comma) +
  theme(legend.position = "right")

wic11_plot <- plot_usmap(data=state, values="WIC2011", lines="white") +
  labs(title="WIC Participants 2011") +
  scale_fill_continuous(low="white", high="blue", name = "Num. Participants", label = scales::comma) +
  theme(legend.position = "right")

wic12_plot <- plot_usmap(data=state, values="WIC2012", lines="white") +
  labs(title="WIC Participants 2012") +
  scale_fill_continuous(low="white", high="blue", name = "Num. Participants", label = scales::comma) +
  theme(legend.position = "right")

wic13_plot <- plot_usmap(data=state, values="WIC2013", lines="white") +
  labs(title="WIC Participants 2013") +
  scale_fill_continuous(low="white", high="blue", name = "Num. Participants", label = scales::comma) +
  theme(legend.position = "right")

wic14_plot <- plot_usmap(data=state, values="WIC2014", lines="white") +
  labs(title="WIC Participants 2014") +
  scale_fill_continuous(low="white", high="blue", name = "Num. Participants", label = scales::comma) +
  theme(legend.position = "right")

wic15_plot <- plot_usmap(data=state, values="WIC2015", lines="white") +
  labs(title="WIC Participants 2015") +
  scale_fill_continuous(low="white", high="blue", name = "Num. Participants", label = scales::comma) +
  theme(legend.position = "right")


plot(wic09_plot)
plot(wic11_plot)
plot(wic012_plot)
plot(wic13_plot)
plot(wic014_plot)
plot(wic15_plot)