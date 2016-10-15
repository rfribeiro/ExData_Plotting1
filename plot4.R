#setwd("C:\\Users\\rafae\\Downloads\\ExData_Plotting1")
data <- read.table(".\\data\\household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, dec = ".", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subData <- data[data$Date >= "2007/02/01" & data$Date <= "2007/02/02",]
subData$DateTime <- strptime(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")
png(file = "plot4.png", width = 480, height = 480)

# set lines
par(mfrow = c(2,2))

# plot 1
plot(subData$DateTime, subData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

# plot 2
plot(subData$DateTime, subData$Voltage, type = "l", ylab = "Voltage", xlab="datetime")

# plot 3
plot(subData$DateTime, subData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
points(subData$DateTime, subData$Sub_metering_2, type = "l", col = "red")
points(subData$DateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c(names(subData)[7], names(subData)[8], names(subData)[9]), 
       lty = c(1,1,1), bty = "n",
       col=c("black","red","blue"))

# plot 4
plot(subData$DateTime, subData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()