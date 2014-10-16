### Load libraries
library(ggplot2)
library(scales)

### Load data
load('./data/data.Rdata')

### Scatter Plot ###----
# population vs stores
ggplot(
  aes(x = XXXX, y = XXXX), # Replace the XXXX
  data = summary2005) +
  geom_point()

## Scatter Plot + regression line ###----
# Hint: Use the cheat sheet to find the right geom
ggplot(
  aes(x = population, y = stores), 
  data = summary2005) +
  geom_point() +
  geom_XXXX() # Replace the XXXX

### Bubble Chart ###----
# Bubbles represent market_share
ggplot(
  aes(x = population, y = stores,
      XXXX = market_share), # Replace the XXXX
  data = summary2005) +
  geom_point()

### Bar chart - Unordered ###----
ggplot(
  aes(x = state,
      y = population),
  data = summary2005) +
  geom_bar(stat = 'identity')

### Bar chart - ordered ###----
ggplot(
  aes(x = reorder(state, population),
      y = population),
  data = summary2005) +
  geom_bar(stat = 'identity')

### Bar chart - ordered & flipped ###----
# Edit code to flip this bar chart (States will show vertically)
# Hint: Use the cheat sheet to find the right coord
ggplot(
  aes(x = reorder(state, population),
      y = population),
  data = summary2005) +
  geom_bar(stat = 'identity') +
  coord_XXXX() # Replace the XXXX

### Stacked Bar chart ###----
# Edit the code so each bar represents the total population of the US for each year
# 1) What does the current number represent
# 2) Why did happen here? (Think about part 1 of the workshop)
# 3) Which aspect of the grammar of graphics is incorrectly defined?
ggplot(
  aes(x = factor(year),
      y = population),
  data = summary95_05) +
  geom_bar(stat = 'identity',
           position = 'identity') +
  scale_y_continuous(labels = comma)
 
# Objective:
# Visualize increase of stores over time, by state
### Line chart - iteration 1 ###----
# Fix the code for this chart
ggplot(
  aes(x = year,
      y = stores),
  data = summary) +
  geom_line()

### Line chart - iteration 2 ###----
# Edit code to change lines color depending on state
ggplot(
  aes(x = year,
      y = stores,
      group = state),
  data = summary) +
  geom_line()

### Line chart - iteration 3 ###----
# Edit the code to produce the following small multiple
# ONE chart per state
ggplot(
  aes(x = year,
      y = stores,
      group = state,
      color = state),
  data = summary) +
  geom_line()
