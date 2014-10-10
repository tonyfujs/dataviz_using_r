library(plyr)
df <- movies
myear <- ddply(df, .(year), colwise(mean, .(length, rating)))
myear <- myear[myear$length > 95, ]
p <- ggplot(myear, aes(length, rating))
p + geom_path()

myear <- arrange(myear, length)
myear <- arrange(myear, row.names(myear))
myear <- arrange(myear, rating)
myear <- arrange(myear, year)

p <- ggplot(myear, aes(length, rating))
p + geom_line()
