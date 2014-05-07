plot1 <- function () {
	data <- read.csv("household_power_consumption.txt", head = TRUE, sep = ";", na.strings = "?")
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

	png(file = "plot1.png", width = 480, height = 480, units = "px")
	with(data, hist(data$Global_active_power, freq=TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
	dev.off()
}