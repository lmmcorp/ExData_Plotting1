plot2 <- function (){
	data <- read.csv("household_power_consumption.txt", head = TRUE, sep = ";", na.strings = "?")
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

	timevector <- paste(data$Date, data$Time)
	timevector <- as.POSIXlt(timevector)

	png(file = "plot2.png", width = 480, height = 480, units = "px")
	with(data, plot(timevector, data$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = " ", main = " "))
	dev.off()
}