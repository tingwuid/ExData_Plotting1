library(datasets)
fileName <- "household_power_consumption.txt"
data <- read.table(text=grep("^[1,2]/2/2007",readLines(fileName),value = TRUE),sep = ";",header = TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),na.strings="?")
time <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(time, data)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))


with(data, {
    plot(data$time, data$Global_active_power, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(data$time, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(data$time, data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
         xlab = "")
    lines(data$time,Sub_metering_2,col="red")
    lines(data$time,Sub_metering_3,col="blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(data$time, data$Global_reactive_power, type = "l", 
         ylab = "Global_rective_power", xlab = "datetime")
})
