library(datasets)
fileName <- "household_power_consumption.txt"
data <- read.table(text=grep("^[1,2]/2/2007",readLines(fileName),value = TRUE),sep = ";",header = TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),na.strings="?")
time <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(time, data)
with(data,{plot(data$time,Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "",col="black")
    lines(data$time,Sub_metering_2,col="red")
    lines(data$time,Sub_metering_3,col="blue")
})
legend("topright",lty = 1, lwd = 2, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
