

# Install Packages --------------------------------------------------------

install.packages("skimr")

# Loading Packages ---------------------------------------------------------

library(tidyverse)
library("skimr")

# Saving the Penguin Data-sets Locally  ------------------------------------

write_csv(palmerpenguins::penguins, "data/penguin.csv")

# Import Data -------------------------------------------------------------

Penguins <- read_csv("data/penguin.csv")

# Exploratory Data Analysis -----------------------------------------------

install.packages("palmerpenguins")

## Structure of the Data-set ---------

str(penguins)

## Convert Character Column to Factors -------------------------------------

penguins |> 
  mutate(
    species = as.factor(species),
    island = as.factor(island),
    sex =as.factor(sex),
    year = as.integer(year)
  )


### Second Method
Penguins |>  mutate(
  across(is.character, as.factor),
  year = as.integer(year)
  ) |>
  str()

## Summary of Data ------------

summary(penguins)

## Skim for more robust summary ----------
skim(penguins)

## Handling sex missing data ------------------

penguins |> 
  count(sex)

penguins |> 
  filter(!is.na(sex))

### Second method

Penguins |>  mutate(
  across(is.character, as.factor),
  year = as.integer(year)
) |>
  filter(!is.na(sex))

## Handling sex missing data ------------------


## Univariate analysis
