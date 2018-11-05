# Exploratory Data Analysis (Coursera Data Science)
# Course Project 1 - Plot 2
# J.Roland

#clear workspace
rm(list=ls())

#load data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#change class of the Date column from factor to Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset the data to just the two target dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#concatenate date and time into a single variable so it will plot on one axis and convert to POSIX for calendar
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#convert to POSIXct
data$datetime <- as.POSIXct(data$datetime)

#plot2
plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#save plot file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

