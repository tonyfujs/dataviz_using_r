### TO DO FIRST:
# Set your working directory by clicking on: "Session" > "Set Working Directory" > "To Source File Location"

### Load libraries
library(ggplot2)
library(scales)
library(ggthemes)

### Load data
load('./data/data.Rdata')


##############################################
###   Napoleon Russian Campaign (Minard)   ###
##############################################

# Minard iteration 1: Plot troups location over time with a line
ggplot() + 
  geom_path(
    aes(x = long, y = lat, group = group), 
    data = troops, 
    lineend = "round")

# Minard iteration 2: Add color to show directions of the troups

# Minard iteration 3: Adjust line size to show number of survivors

# Minard iteration 4: Add cities on the plot (One point for each city)

# Minard iteration 5: Add city names on the plot beside each corresponding point

# Minard iteration 6: Change lines color


##############################################
###       Walmart map: Small multiples     ###
##############################################

### Get a sense of geographical data
# scatter of long vs lat
ggplot(
	aes(),
	data = walmart) +
	geom_point()

# Walmart Iteration 1: Initialize default ggplot & draw US map
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3")

# Walmart Iteration 2: Add points representing walmart stores

# Walmart Iteration 3: Change point color if NEW store

# Walmart Iteration 3: Change point color if NEW store

# Walmart Iteration 4: Make sure geographic proportion are respected

# Walmart Iteration 5: Create a small multiple (ONE chart per year)

# Walmart Iteration 6: Deal with overplotting

# Walmart Iteration 7: Deal with "new" treated as continuous
