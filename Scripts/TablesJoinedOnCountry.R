library(tidyverse)


Happiness <- read_csv("/cloud/project/data/Imported_Data/Happiness.csv")
GDP <- read_csv("/cloud/project/data/Imported_Data/GDP.csv")
Corruption <- read_csv("/cloud/project/data/Imported_Data/Corruption.csv")
Freedom <- read_csv("/cloud/project/data/Imported_Data/Freedom.csv")
Generosity <- read_csv("/cloud/project/data/Imported_Data/Generosity.csv")
Family <- read_csv("/cloud/project/data/Imported_Data/Family.csv")
LifeExpectancy <- read_csv("/cloud/project/data/Imported_Data/LifeExpectancy.csv")


merged_data <- Happiness %>%
  left_join(GDP, by = "Country") %>%
  left_join(Corruption, by = "Country") %>%
  left_join(Freedom, by = "Country") %>%
  left_join(Generosity, by = "Country") %>%
  left_join(Family, by = "Country") %>%
  left_join(LifeExpectancy, by = "Country")


cleaned_data <- merged_data %>%
  select(
    Country,
    AvgHappiness_Score,
    AvgGDP,
    AvgCorruption,
    AvgFreedom,
    AvgGenerosity,
    AvgFamily,
    AvgLifeExpectancy
  ) %>%
  drop_na()

cleaned_data[2,8] <- scale(cleaned_data[3,8])



