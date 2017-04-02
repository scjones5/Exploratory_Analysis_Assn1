setwd("/Users/sjones/Google Drive/Coursera/Exploratory_Data_Analysis/assn1")

file = "household_power_consumption.txt"

powers <- read.table(file, header=TRUE, sep=";", na.string="?")

days <- subset(powers, Date=="1/2/2007" | Date=="2/2/2007")

png("plot1.png")

hist(days$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()