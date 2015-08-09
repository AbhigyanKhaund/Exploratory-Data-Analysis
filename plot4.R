dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";")
newdata <- data[which(data$Date = c("1/2/2007","2/2/2007")) ,]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(newdata$Sub_metering_1)
subMetering2 <- as.numeric(newdatta$Sub_metering_2)
subMetering3 <- as.numeric(newdata$Sub_metering_3) 

globalActivePower <- as.numeric(newdata$Global_active_power)
globalReactivePower <- as.numeric(newdata$Global_reactive_power)
voltage <- as.numeric(newdata$Voltage)

png("plot41.png", width=480, height=480)
par(mfrow = c(2, 2)) 
par(mar = c(5, 4, 4, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()