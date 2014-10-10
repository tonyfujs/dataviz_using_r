### Set your working directory
# Session > Set Working Directory > To Source File Location

### Load libraries
library(ggthemes)
library(ggplot2)
library(plyr)

### load data
walmart <- read.csv('./data/walmart_data.csv')
mini_walmart <- read.csv('./data/mini_walmart.csv')
summary <- read.csv('./data/summary.csv')

p <- ggplot()
### MAPPING AESTHETICS----
############################################################
### Mapping on x & y----
aes_position <- p + geom_point(
    aes(x = state,y = stores), size = 5,
    data = mini_walmart) +
  theme_tufte() 

#ggsave(filename = './charts/aes_position.png', units = c("cm"), width = 20, height = 15)

### Adding a third dimension----
# Color continous----
aes_color_continous <- p + geom_point(
  aes(x = state,y = stores, color = stores), size = 5,
  data = mini_walmart) +
  scale_colour_gradient(limits = c(min(mini_walmart$stores), max(mini_walmart$stores)),
                         low = "#98FB98",
                         high = "#008000") +
  theme_tufte()

#ggsave(filename = './charts/aes_color_continous.png', units = c("cm"), width = 20, height = 15)

# Color categorical----
aes_color_categorical <- p + geom_point(
  aes(x = state,y = stores, color = state), size = 5,
  data = mini_walmart) +
  theme_tufte()

#ggsave(filename = './charts/aes_color_categorical.png', units = c("cm"), width = 20, height = 15)

# Shape----
aes_shape <- p + geom_point(
  aes(x = state,y = stores, shape = state), size = 5,
  data = mini_walmart) +
  theme_tufte()

#ggsave(filename = './charts/aes_shape.png', units = c("cm"), width = 20, height = 15)

### Insert a QUESTION HERE: 
# map stores to size----
aes_size <- p + geom_point(
  aes(x = state,y = stores, size = stores),
  data = mini_walmart) +
  theme_tufte() +
  scale_size_continuous(range = c(5, 15))

#ggsave(filename = './charts/aes_size.png', units = c("cm"), width = 20, height = 15)

# map state to both shape & color----
aes_double <- p + geom_point(
  aes(x = state,y = stores, shape = state, color = state), size = 7,
  data = mini_walmart) +
  theme_tufte()

#ggsave(filename = './charts/aes_double.png', units = c("cm"), width = 20, height = 15)

### Set up an aesthetic manually
# size
aes_manual <- ggplot(data = mini_walmart, aes(x = state, y = stores, shape = state, color = state)) +
  geom_point(size = 12, stat = 'identity') +
  theme_tufte()

#ggsave(filename = './charts/aes_manual.png', units = c("cm"), width = 20, height = 15)

### SCALE----
############################################################
### Controlling scales----

# y position continous
scale_y_cont <- p + geom_point(
  aes(x = state,y = stores), size = 5,
  data = mini_walmart) +
  scale_y_continuous() +
  theme_tufte()

#ggsave(filename = './charts/scale_y_cont.png', units = c("cm"), width = 20, height = 15)

# y position log
scale_y_log <- p + geom_point(
  aes(x = state,y = stores), size = 5,
  data = mini_walmart) +
  scale_y_log10(limits = c(1, 1000), breaks = c(1:10,100,1000)) +
  theme_tufte()

#ggsave(filename = './charts/scale_y_log.png', units = c("cm"), width = 20, height = 15)


# Color continous - GREEN----
scale_color_green <- p + geom_point(
  aes(x = state,y = stores, color = stores), size = 5,
  data = mini_walmart) +
  scale_color_continuous(low = "light green",
                         high = "dark green") +
  theme_tufte()

#ggsave(filename = './charts/scale_color_green.png', units = c("cm"), width = 20, height = 15)

# Color continous - BLUE----
scale_color_blue <- p + geom_point(
  aes(x = state,y = stores, color = stores), size = 5,
  data = mini_walmart) +
  scale_colour_gradient(low = "light blue",
                        high = "dark blue") +
  theme_tufte()

#ggsave(filename = './charts/scale_color_blue.png', units = c("cm"), width = 20, height = 15)

### GEOMETRIC OBJECTS----
############################################################
### Learning the gg: geometric object
# geom = point----
geom_point <- p + geom_point(
  aes(x = state,y = stores), size = 5,
  data = mini_walmart) +
  theme_tufte()

#ggsave(filename = './charts/geom_point.png', units = c("cm"), width = 20, height = 15)

# geom = bar
geom_bar <- p + geom_bar(
  aes(x = state,y = stores),
  stat = 'identity',
  data = mini_walmart) +
  theme_tufte()

#ggsave(filename = './charts/geom_bar.png', units = c("cm"), width = 20, height = 15)

# geom = line
geom_line <- p + geom_line(
  aes(x = state,y = stores, group = year),
  data = mini_walmart) +
  theme_tufte()

#ggsave(filename = './charts/geom_line.png', units = c("cm"), width = 20, height = 15)

### Insert a QUESTION HERE to test understanding
# How to add labels to our chart?
# scatter plot: geom = text - NO LABEL VALUE
ggplot(
  data = mini_walmart,
  mapping = aes(x = state, y = stores)) +
  geom_text()

# geom = text - LABEL FROM DATA
geom_text <- p + geom_text(
  aes(x = state,y = stores, label = stores),
  size = 5,
  data = mini_walmart) +
  theme_tufte()

#ggsave(filename = './charts/geom_text.png', units = c("cm"), width = 20, height = 15)

# geom = text - FIXED LABEL
# ggplot(
#   data = df,
#   mapping = aes(x = state, y = stores)) +
#   geom_text(label = 'text')


### POSITION ADJUSTMENT-----
############################################################
## position = "identity" - POINT
pos_id_point <- p + geom_point(
  aes(x = factor(year), y = stores),
  size = 5,
  data = mini_walmart) +
  theme_tufte() + 
  theme(axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_point.png', units = c("cm"), width = 20, height = 15)

## position = "identity" - BAR
# Same color
pos_id_bar <- p + geom_bar(
  aes(x = factor(year), y = stores),
  stat = 'identity',
  position = 'identity',
  width = 0.3,
  data = mini_walmart) +
  theme_tufte() + 
  theme(axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_bar.png', units = c("cm"), width = 20, height = 15)

# Add color
pos_id_bar2 <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'identity',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart) +
  theme_tufte() + 
  theme(axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_bar2.png', units = c("cm"), width = 20, height = 15)

# Get hex color codes
n <- 5
my_colors <- hcl(h=seq(15, 375-360/n, length=n)%%360, c=100, l=65)
my_colors <- c("#F8766D", "#A3A500", "#00BF7D", "#00B0F6", "#E76BF3")

#####################################################################
#####                       CLEAN CODE                          #####
#####################################################################
# SHOW ANIMATED SLIDE OF HOW THE BARS ARE ADDED ONE ON TOP OF EACH OTHER
pos_id_bar2a <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'identity',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart[1, ]) +
  scale_fill_manual(values = my_colors[1]) +
  theme_tufte() + 
  theme(
    axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_bar2a.png', units = c("cm"), width = 20, height = 15)

pos_id_bar2b <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'identity',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart[1:2, ]) +
  scale_fill_manual(values = my_colors[1:2]) +
  theme_tufte() + 
  theme(
    axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_bar2b.png', units = c("cm"), width = 20, height = 15)

pos_id_bar2c <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'identity',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart[1:3, ]) +
  scale_fill_manual(values = my_colors[1:3]) +
  theme_tufte() + 
  theme(
    axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_bar2c.png', units = c("cm"), width = 20, height = 15)

pos_id_bar2d <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'identity',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart[1:4, ]) +
  scale_fill_manual(values = my_colors[1:4]) +
  theme_tufte() + 
  theme(
    axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_bar2d.png', units = c("cm"), width = 20, height = 15)


pos_id_bar2e <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'identity',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart[1:5, ]) +
  scale_fill_manual(values = my_colors[1:5]) +
  theme_tufte() + 
  theme(
    axis.title.x = element_blank())

#ggsave(filename = './charts/pos_id_bar2e.png', units = c("cm"), width = 20, height = 15)

# NEEDS POSITION ADJUSTMENT TO DEAL WITH OVERPLOTTING

## position = "dodge" - BAR
pos_dodge <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'dodge',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart) +
  theme_tufte() + 
  theme(axis.title.x = element_blank())

#ggsave(filename = './charts/pos_dodge.png', units = c("cm"), width = 20, height = 15)

## position = "stack" - BAR
pos_stack <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'stack',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart) +
  theme_tufte() + 
  theme(axis.title.x = element_blank())

#ggsave(filename = './charts/pos_stack.png', units = c("cm"), width = 20, height = 15)

## position = "fill" - BAR
pos_fill <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  position = 'fill',
  stat = 'identity',
  width = 0.3,
  data = mini_walmart) +
  theme_tufte() + 
  theme(axis.title.x = element_blank())

#ggsave(filename = './charts/pos_fill.png', units = c("cm"), width = 20, height = 15)

### COORDINATE SYSTEM-----
############################################################
### Learning the gg: coordinate system
# Cartesian coordinates
coord_card <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  width = 0.3,
  stat = 'identity',
  position = 'fill',
  data = mini_walmart) +
  theme_tufte() + 
  theme(axis.title.x = element_blank())

#ggsave(filename = './charts/coord_card.png', units = c("cm"), width = 20, height = 15)

# polar coordinates (theta = y)
coord_polar_y <- p + geom_bar(
  aes(x = factor(year), y = stores, fill = state),
  stat = 'identity',
  position = 'fill',
  data = mini_walmart) +
  theme_tufte() + 
  xlab("2005") +
  theme(axis.text.y = element_blank(),
        axis.ticks = element_blank()) +
  coord_polar(theta = 'y')

#ggsave(filename = './charts/coord_polar_y.png', units = c("cm"), width = 20, height = 15)

# polar coordinates (theta = x)
# coord_polar_x <- p + geom_bar(
#   aes(x = factor(year), y = stores, fill = state),
#   stat = 'identity',
#   position = 'fill',
#   data = mini_walmart) +
#   theme_tufte() + 
#   xlab("2005") +
#   theme(axis.text.y = element_blank(),
#         axis.ticks = element_blank()) +
#   coord_polar()

#ggsave(filename = './charts/coord_polar_x.png', units = c("cm"), width = 20, height = 15)




### STATISTICAL TRANSFORMATION----
############################################################
# stat - identity
stat_identity <- p + geom_point(
  aes(x = population,y = stores), 
  stat = "identity",
  data = summary) +
  theme_tufte()  

#ggsave(filename = './charts/stat_identity.png', units = c("cm"), width = 20, height = 15)


# stat - smooth (point)
stat_smooth_point <- p + geom_point(
  aes(x = population,y = stores), 
  stat = "smooth",
  method = "lm",
  data = summary) +
  theme_tufte()

#ggsave(filename = './charts/stat_smooth_point.png', units = c("cm"), width = 20, height = 15)

# stat - smooth (line)
stat_smooth_line <- p + geom_line(
  aes(x = population,y = stores), 
  stat = "smooth",
  method = "lm",
  data = summary) +
  theme_tufte()

#ggsave(filename = './charts/stat_smooth_line.png', units = c("cm"), width = 20, height = 15)

# stat - smooth + identity (line + point)
stat_smooth_both <- p + geom_line(
  aes(x = population,y = stores), color = 'blue',
  stat = "smooth",
  method = "lm",
  data = summary) +
  geom_point(aes(x = population,y = stores),
  data = summary) +
  theme_tufte()

#ggsave(filename = './charts/stat_smooth_both.png', units = c("cm"), width = 20, height = 15)

########################################
#INTRODUCE THE CONCEPT OF LAYER HERE

### FACETING----
############################################################
# Simple facet_wrap
facet_wrap <- ggplot(data = summary,
                     aes(x = population, y = stores)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~year)

#ggsave(filename = './charts/facet_wrap.png', units = c("cm"), width = 20, height = 15)

# Facet wrap - line1
facet_wrap_line1 <- ggplot(data = summary,
                     aes(x = year, y = stores, group = state)) +
  geom_line() +
  facet_wrap(~year)

#ggsave(filename = './charts/facet_wrap_line1.png', units = c("cm"), width = 20, height = 15)

# Facet wrap - line2
facet_wrap_line2 <- ggplot(data = summary,
                          aes(x = year, y = stores, group = state, color = state)) +
  geom_line(size = 1) +
  theme(legend.position = 'none') +
  facet_wrap(~state)

#ggsave(filename = './charts/facet_wrap_line2.png', units = c("cm"), width = 20, height = 15)



