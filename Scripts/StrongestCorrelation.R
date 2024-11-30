library(tidyverse)

source("/cloud/project/Scripts/TablesJoinedOnCountry.R")


HappinessScores <- cleaned_data$AvgHappiness_Score

independentVariables <- cleaned_data %>%
  select(-Country, -AvgHappiness_Score)


correlations <- sapply(independentVariables, function(x) cor(x, HappinessScores, use = "complete.obs"))


cor_df <- data.frame(
  Variable = names(correlations),
  Correlation = correlations
)


top_correlations <- cor_df %>%
  arrange(desc(abs(Correlation))) %>%
  slice(1:6)

sink("/cloud/project/data/TopCorrelations.txt")
print("Top Correlations")
print(top_correlations)
sink()


topCorrelationGraphs <- ggplot(top_correlations, aes(x = reorder(Variable, Correlation), y = Correlation)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() + 
  labs(
    title = "Top 6 Variables Correlated with Average Happiness Score",
    x = "Variable",
    y = "Correlation Coefficient"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 12)
  )+ 
  geom_text(aes(label = round(Correlation, 2)), hjust = -0.1, size = 4)

# Display the plot
print(topCorrelationGraphs)
ggsave("/cloud/project/Plots/TopCorrelationsPlot.png", plot = topCorrelationGraphs, width = 8, height = 6)
