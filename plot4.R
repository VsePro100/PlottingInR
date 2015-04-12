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

##plot 4
#set panel
par(mfrow = c(2,2)) 
#subplot1
plot(d[[2]],d[[3]],xlab="",ylab = "Global Active Power",type="l")
#subplot2
plot(d[[2]], d$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
#subplot3
plot(d[[2]], d[[7]], type="l", xlab = "", ylab = "Energy sub metering")
lines(d[[2]],d[[8]],col="red")
lines(d[[2]],d[[9]],col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col =c("black","blue","red"),lwd=1)
#subplot4
plot(d[[2]],d[[4]],xlab="datetime",ylab="Global_reactive_power",type="l")
