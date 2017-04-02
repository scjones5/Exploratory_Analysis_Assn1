setwd("/Users/sjones/Google Drive/Coursera/Exploratory_Data_Analysis/assn1")

file = "household_power_consumption.txt"

powers <- read.table(file, header=TRUE, sep=";", na.string="?")

days <- subset(powers, Date=="1/2/2007" | Date=="2/2/2007")

date <- days$Date
time <- days$Time

png("plot4.png")

x <- strptime(paste(date, time), "%d/%m/%Y %H:%M:%S")

#Two rows, two columns
par(mfrow=c(2,2))

y1 <- days$Global_active_power
y2 <- days$Voltage
y3_1 <- days$Sub_metering_1
y3_2 <- days$Sub_metering_2
y3_3 <- days$Sub_metering_3
y4 <- days$Global_reactive_power

plot(x, y1, xlab="", ylab="Global Active Power", type="l")
plot(x, y2, xlab="datetime", ylab="Voltage", type="l")

plot(x, y3_1, xlab="", ylab="Energy sub metering", type="n")
points(x, y3_1, col="black", type="l")
points(x, y3_2, col="red", type="l")
points(x, y3_3, col="blue", type="l")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x, y4, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()