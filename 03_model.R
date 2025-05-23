library(readr)
library(rsample)
library(parsnip)
library(kknn)
library(dplyr)
library(workflows)

data <- readr::read_csv("data/penguin_modelready.csv") %>%
  mutate(species = as.factor(species)) # Need to respecify that they are factors

# Split data
set.seed(123)
data_split <- rsample::initial_split(data, strata = species)
train_data <- rsample::training(data_split)
test_data <- rsample::testing(data_split)

# Define model
penguin_model <- parsnip::nearest_neighbor(mode = "classification", neighbors = 5) %>%
  parsnip::set_engine("kknn") # Requires kknn package

# Create workflow
penguin_workflow <- workflows::workflow() %>%
  workflows::add_model(penguin_model) %>%
  workflows::add_formula(species ~ .)

# Fit model
penguin_fit <- penguin_workflow %>%
  parsnip::fit(data = train_data)

# Save for future steps
readr::write_csv(train_data, "data/train_data.csv") # new .csv to work with
readr::write_csv(test_data, "data/test_data.csv") # new .csv to work with
readr::write_rds(penguin_fit, "output/penguin_fit.RDS") # Save any arbitrary R object into a file; don't need to rerun model stuff again unless you want additional steps
