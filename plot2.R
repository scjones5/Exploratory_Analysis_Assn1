setwd("/Users/sjones/Google Drive/Coursera/Exploratory_Data_Analysis/assn1")

file = "household_power_consumption.txt"

powers <- read.table(file, header=TRUE, sep=";", na.string="?")

days <- subset(powers, Date=="1/2/2007" | Date=="2/2/2007")

date <- days$Date
time <- days$Time

png("plot2.png")

x <- strptime(paste(date, time), "%d/%m/%Y %H:%M:%S")

y <- days$Global_active_power

plot(x, y, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()