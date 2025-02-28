library(palmerpenguins)
library(readr)
library(dplyr)
library(tidyr)

# Load Libraries and Data
data <- penguins

# Initial cleaning: Remove missing values
data <- data %>% tidyr::drop_na()

# Save for future steps
readr::write_csv(data, "data/penguin_clean.csv") # Need data folder to exist first
