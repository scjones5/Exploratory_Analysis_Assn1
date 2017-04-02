setwd("/Users/sjones/Google Drive/Coursera/Exploratory_Data_Analysis/assn1")

file = "household_power_consumption.txt"

powers <- read.table(file, header=TRUE, sep=";", na.string="?")

days <- subset(powers, Date=="1/2/2007" | Date=="2/2/2007")

date <- days$Date
time <- days$Time

png("plot3.png")

x <- strptime(paste(date, time), "%d/%m/%Y %H:%M:%S")

y1 <- days$Sub_metering_1
y2 <- days$Sub_metering_2
y3 <- days$Sub_metering_3

plot(x, y1, xlab="", ylab="Energy sub metering", type="n")
points(x, y1, col="black", type="l")
points(x, y2, col="red", type="l")
points(x, y3, col="blue", type="l")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()