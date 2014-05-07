plot4 <- function() {
	data <- read.csv("household_power_consumption.txt", head = TRUE, sep = ";", na.strings = "?")
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

	timevector <- paste(data$Date, data$Time)
	timevector <- as.POSIXlt(timevector)

	png(file = "plot4.png", width = 480, height = 480, units = "px")
	par(mfcol = c(2,2))
	plot(timevector, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ", main = " ")	
	plot(timevector, data$Sub_metering_1, col = "black", type = "l", ylab = "Energy sub Metering", xlab =" ", main = " ")
	lines(timevector, data$Sub_metering_2, col = "red", type = "l")
	lines(timevector, data$Sub_metering_3, col = "blue", type = "l")
	legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
	plot(timevector, data$Voltage, col = "black", type = "l", xlab = "datetime", ylab = "Voltage", main = " ")
	plot(timevector, data$Global_reactive_power, col = "black", type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = " ")
	dev.off()
}	