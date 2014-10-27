library(plyr)
library(reshape2)
library(stringr)

### load data
# walmart
walmart <- read.csv('./data/walmart.csv', header = TRUE, stringsAsFactors = FALSE)
walmart <- subset(walmart, year %in% c(1965, 1970, 1975, 1980, 1985, 1990, 1995, 2000, 2005))
walmart$id <- paste0(walmart$year, walmart$state)
# us_population
pop <- read.csv('./data/us_population.csv', header = TRUE, stringsAsFactors = FALSE)
md <- melt(pop, id = c('state', 'state_name'))
md$variable <- str_replace(md$variable, "X", "")
md$variable <- as.numeric(md$variable)
md <- subset(md, variable %in% c(1965, 1970, 1975, 1980, 1985, 1990, 1995, 2000, 2005))
md$id <- paste0(md$variable, md$state)
# merge data sets
walmart_data <- merge(walmart, md[,c('value', 'id')], by = 'id')
walmart_data <- arrange(walmart_data, storenum)
my_columns <- names(walmart_data)
my_columns[9] <- 'population'
names(walmart_data) <- my_columns
walmart_data <- subset(walmart_data, select = -id)
walmart_data <- subset(walmart_data, select = -opendate)

# save data set as .csv
write.csv(walmart_data, file = './data/walmart_data.csv', row.names = FALSE)

# Create a subset of the walmart data
walmart2005 <- subset(walmart, year == 2005)

# Create a subset of the summary data
summary2005 <- subset(summary, year == 2005)
summary2005$market_share <- runif(nrow(summary2005), min = 0.05, max = 0.6)
length(unique(summary2005$state))

summary1995 <- subset(summary, year == 1995)
summary1995$market_share <- runif(nrow(summary1995), min = 0.05, max = 0.6)
length(unique(summary1995$state))

summary95_05 <- rbind(summary1995, summary2005)

runif(1, min = 0.05, max = 0.6)
# load('./output/01_gg_theory.Rdata')
# file <- ls()
# df <- c('mini_walmart', 'summary', 'walmart')
# file <- file[!file %in% df]
# rm(list = file)
# rm(df)
# rm(file)


summary <- ddply(walmart_data, .(year, state), summarise, 
                 stores = length(unique(storenum)),
                 population = unique(population))
# save data set as .csv
write.csv(summary, file = './data/summary.csv', row.names = FALSE)


#df <- subset(summary, year == 2005 & state %in% c('VT', 'NV', 'NJ', 'MI', 'FL'))
#write.csv(df, file = './data/mini_walmart.csv', row.names = FALSE)
mini_walmart <- read.csv('./data/mini_walmart.csv')
df2 <- ddply(walmart, .(year, state, new), summarise,
             stores = length(unique(storenum)))
df2 <- subset(df2, year == 2005 & state %in% c('VT', 'NV', 'NJ', 'MI', 'FL'))
df2$new[df2$new == 0] <- 'old'
df2$new[df2$new == 1] <- 'new'
df2 <- arrange(df2, year, new)

ht <- read.csv('./data/heights.csv', header = TRUE)