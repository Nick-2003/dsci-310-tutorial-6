library(readr)
library(dplyr)
library(yardstick)
library(workflows) # To run penguin_fit workflow properly

train_data <- readr::read_csv("data/train_data.csv") %>%
  mutate(species = as.factor(species)) # Need to respecify that they are factors
test_data <- readr::read_csv("data/test_data.csv") %>%
  mutate(species = as.factor(species)) # Need to respecify that they are factors
penguin_fit <- readr::read_rds("output/penguin_fit.RDS")

# Predict on test data
predictions <- predict(penguin_fit, test_data, type = "class") %>%
  dplyr::bind_cols(test_data)

# Confusion matrix
conf_mat <- yardstick::conf_mat(predictions, truth = species, estimate = .pred_class)
conf_mat

readr::write_rds(conf_mat, "output/conf_mat.RDS") 
