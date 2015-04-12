## load the file destination folder 
setwd("C:/Users/Федор/Documents/Coursera/GettingData/Programming assignment/Week1")

## load and convert data to proper format
file <- "household_power_consumption.txt"
data <- read.table(file,header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
str(data)
head(data)

## subset data
date2 <- as.Date("2007-02-02") #this way it's easier to not fall in trap of D/M and M/D 
date1 <- date2-1
# good <- data$Date == date1 | data$Date == date2
# table(good)
d <- subset(data, data$Date == date1 | data$Date == date2)
str(d)
summary(d)

## set locale to fix day issue in xlab
Sys.setlocale("LC_ALL","C")

##plot 2
plot(d[[2]],d[[3]], type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
