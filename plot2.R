setwd("/home/aditya/DataScienceCoursera/ExData_Plotting1")

## Loading the dataset into a data frame
power_consumption_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")

## Subsetting the data for the given data range
data <- subset(power_consumption_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_consumption_data)

## Converting dates
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)

## Generating Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving Plot 2 to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()