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
  geom_path(aes(x = long, y = lat, group = group), data = troops, lineend = "round")

# Minard iteration 2: Add color to show directions of the troups
ggplot() + 
  geom_path(aes(x = long, y = lat, group = group, color = direction), data = troops, lineend = "round")

# Minard iteration 3: Adjust line size to show number of survivors
ggplot() + 
  geom_path(aes(x = long, y = lat, group = group, color = direction, size = survivors), data = troops, lineend = "round")

# Minard iteration 4: Add cities on the plot (One point for each city)
ggplot() + 
	geom_path(aes(x = long, y = lat, group = group, color = direction, size = survivors), data = troops, lineend = "round") +
	geom_point(aes(x = long, y = lat), data = cities)

# Minard iteration 5: Add city names on the plot beside each corresponding point
ggplot() + 
	geom_path(aes(x = long, y = lat, group = group, color = direction, size = survivors), data = troops, lineend = "round") +
	geom_point(aes(x = long, y = lat), data = cities) +
	geom_text(aes(x = long, y = lat-0.03, label = city), size = 4, data = cities)
 

# Minard iteration 6: Change lines color
ggplot() + 
	geom_path(aes(x = long, y = lat, group = group, color = direction, size = survivors), data = troops, lineend = "round") +
	geom_point(aes(x = long, y = lat), data = cities) +
	geom_text(aes(x = long, y = lat-0.03, label = city), size = 4, data = cities) +
	scale_color_manual(values = c("grey50","red"))


# Minard final: Short version of the code
p <- ggplot(aes(x = long, y = lat), data = cities)
p <- p + geom_path(aes(group = group, color = direction, size = survivors), data = troops, lineend = "round")
p <- p + geom_point()
p <- p + geom_text(aes(y = lat-0.03, label = city), size = 4)
p <- p + scale_color_manual(values = c("grey50","red"))
p


##############################################
###       Walmart map: Small multiples     ###
##############################################
# Define custom colors
myPalette <- c('#1F78B4', '#FF0066')
# Define custom transparency
myAlpha <- c(.4, 0.7)  

### Get a sense of geographical data
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_point()

# Walmart Iteration 1: Initialize default ggplot & draw US map
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3")

# Walmart Iteration 2: Add points representing walmart stores
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
	geom_point()

# Walmart Iteration 3: Change point color if NEW store
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
	geom_point(aes(color = new))

# Walmart Iteration 4: Make sure geographic proportion are respected
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
	geom_point(aes(color = new)) +
	coord_map()

# Walmart Iteration 5: Create a small multiple (ONE chart per year)
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
	geom_point(aes(color = new)) +
	coord_map() +
	facet_wrap(~year)

# Walmart Iteration 6: Deal with overplotting
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
	geom_point(aes(color = new, alpha = new)) +
	coord_map() +
	facet_wrap(~year)

# Walmart Iteration 7: Deal with "new" treated as continuous
ggplot(aes(x = long, y = lat), data = walmart) +
	geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
	geom_point(aes(color = factor(new), alpha = factor(new))) +
	coord_map() +
	facet_wrap(~year)

# Walmart Iteration 8: Customize transparency
ggplot(aes(x = long, y = lat), data = walmart) +
  geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
  geom_point(aes(color = factor(new), alpha = factor(new))) +
  coord_map() +
  scale_alpha_manual(values = myAlpha, guide = 'none') +
  facet_wrap(~year)

# Walmart Iteration 9: Customize colors
ggplot(aes(x = long, y = lat), data = walmart) +
  geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3") +
  geom_point(aes(color = factor(new), alpha = factor(new))) +
  coord_map() +
  scale_alpha_manual(values = myAlpha, guide = 'none') +
  scale_colour_manual(values = myPalette, guide = 'none') +
  facet_wrap(~year)


### Walmart final: Short version of the code + customized scales
# Define custom colors
myPalette <- c('#1F78B4', '#FF0066')
# Define custom transparency
myAlpha <- c(.4, 0.7)	

# Initialize ggplot and define default aesthetics and dataset
p <- ggplot(aes(x = long, y = lat), data = walmart)
# Draw US map
p <- p + geom_polygon(aes(group = group), data = us, colour="black", fill="#F7F3F3")
# Add points representing walmart shops
p <- p + geom_point(aes(color = as.factor(new), alpha = as.factor(new)))
# Define custom transparency scale
p <- p + scale_alpha_manual(values = myAlpha, guide = 'none')
# Define custom color scale
p <- p + scale_colour_manual(values = myPalette, guide = 'none')
# Define coordiante system
p <- p + coord_map()
# Facet on year (Create a small multiple version of the chart)
p <- p + facet_wrap(~year)
p	

myPalette <- c('#1F78B4', '#FF0066')
myAlpha <- c(.4, 0.7)	












