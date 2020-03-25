library(tidyverse)
bmore_bridges <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-11-27/baltimore_bridges.csv")
View(bmore_bridges)

bmore_bridges_filter <- bmore_bridges %>% 
  filter (county != "Baltimore city", yr_built >= 1900)

ggplot(data = bmore_bridges_filter) +
  aes(x = county, y = avg_daily_traffic) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  labs(title = "Average Daily Traffic on Maryland Bridges", x = "County", y = "Average Daily Traffic")

ggplot(data = bmore_bridges_filter) +
  aes(x = yr_built) +
  geom_histogram(bins = 30) +
  facet_wrap(~bridge_condition, nrow=2)

ggplot(data = bmore_bridges_filter) +
  aes(x = yr_built, fill = bridge_condition) +
  geom_histogram(bins = 30) 

ggplot(data = bmore_bridges_filter) +
  aes(x = yr_built, color = bridge_condition) +
  geom_histogram(bins = 30) 

ggplot(data = bmore_bridges_filter) +
  aes(x = bridge_condition, y = yr_built) +
  geom_boxplot() +
  theme(panel.background = element_rect(fill = "white")) +
  labs(title = "Conditions of Maryland Bridges Over Time", x = "Bridge Condition", y = "Year")
 