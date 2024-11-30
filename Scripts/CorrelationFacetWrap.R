library(tidyverse)
library(ggpmisc)

source("/cloud/project/Scripts/TablesJoinedOnCountry.R")

# Reshape data to long format using pivot_longer()
longFormat <- cleaned_data %>%
  pivot_longer(
    cols = -c(Country, AvgHappiness_Score),
    names_to = "Variable",
    values_to = "Value"
  )

# Plotting with R-squared values
facetwrap <- ggplot(longFormat, aes(x = Value, y = AvgHappiness_Score)) +
  geom_point(alpha = 0.7, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") + 
  stat_poly_eq(
    aes(label = paste(..rr.label.., sep = "~~~")),
    formula = y ~ x, parse = TRUE, size = 3, label.x.npc = "left", label.y.npc = 0.95
  ) +
  facet_wrap(~ Variable, scales = "free_x") + 
  labs(
    x = "Independent Variable",
    y = "Average Happiness Score",
    title = "Scatter Plots of Happiness vs. Various Factors"
  )


ggsave(
  filename = "/cloud/project/Plots/FacetWrap.png",  
  plot = facetwrap,                                  
  width = 12,                                
  height = 8,                                
  dpi = 300                                 
)
