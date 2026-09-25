

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

penguin_clean <- Penguins |> 
  mutate(
  across(is.character, as.factor),
  year = as.integer(year)
) |>
  filter(!is.na(sex))

## Univariate analysis

penguin_clean$species

penguin_clean |> 
  count(species)

table(penguin_clean$species)

### Visualization

ggplot(
  data = penguin_clean, 
  mapping = aes(species)) +
  geom_bar(
    colour = "red",
    fill = "blue")+
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    vjust = -0.5,
    size = 5
  ) +
  labs(
    x = "species",
    y = "counts",
    title = "Frequency of Penguins in the Behen Archipalago",
    caption = "Data Source: palmerspenguins Package | Graphic by: Deborah Elesie"
  ) +
  theme_minimal(base_size = 16)