library(datasets)
fileName <- "household_power_consumption.txt"
data <- read.table(text=grep("^[1,2]/2/2007",readLines(fileName),value = TRUE), sep=";", header=TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
hist(data$Global_active_power, col="red",main = "Global active power", xlab = "Global Active Power (kilowatts)")
