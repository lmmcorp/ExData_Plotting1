plot3 <- function() {

	data <- read.csv("household_power_consumption.txt", head = TRUE, sep = ";", na.strings = "?")
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

	timevector <- paste(data$Date, data$Time)
	timevector <- as.POSIXlt(timevector)

	png(file = "plot3.png", width = 480, height = 480, units = "px")
	plot(timevector, data$Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab =" ", main = " ")
	lines(timevector, data$Sub_metering_2, col = "red", type = "l")
	lines(timevector, data$Sub_metering_3, col = "blue", type = "l")
	legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	dev.off()

}