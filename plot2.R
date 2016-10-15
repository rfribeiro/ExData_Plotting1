#setwd("C:\\Users\\rafae\\Downloads\\ExData_Plotting1")
data <- read.table(".\\data\\household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, dec = ".", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subData <- data[data$Date >= "2007/02/01" & data$Date <= "2007/02/02",]
subData$DateTime <- strptime(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480)
plot(subData$DateTime, subData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()