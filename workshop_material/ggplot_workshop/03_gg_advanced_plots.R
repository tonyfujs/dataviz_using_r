### Load libraries
library(ggplot2)
library(scales)
library(ggthemes)

### Load data
load('./data/data.Rdata')


##############################################
###   Napoleon Russian Campaign (Minard)   ###
##############################################

# iteration 1: Plot troups location over time with a line
# iteration 2: Add color to show directions of the troups
# iteration 3: Adjust line size to show number of survivors
# iteration 4: Add cities on the plot (One point for each city)
# iteration 5: Add city names on the plot beside each corresponding point
# iteration 6: Change lines color
ggplot() + 
  geom_XXXX(aes(x = long, y = lat, group = group), data = troops, lineend = "round")


##############################################
###       Walmart map: Small multiples     ###
##############################################

### Get a sense of geographical data
# scatter of long vs lat
ggplot(aes(), data = walmart) + geom_point()

# Iteration 1: Initialize default ggplot & draw US map
# Iteration 2: Add points representing stores
# Iteration 3: Change point color if NEW store
# Iteration 3: Change point color if NEW store
# Iteration 4: Make sure geographic proportion are respected
# Iteration 5: Create a small multiple (ONE chart per year)
# Iteration 6: Deal with overplotting
# Iteration 7: Deal with "new" treated as continuous
# Iteration 8: Customize transparency
# Iteration 9: Customize colors
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_XXXX(aes(group = group), data = us, colour="black", fill="#F7F3F3")


