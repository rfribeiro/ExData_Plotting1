#setwd("C:\\Users\\rafae\\Downloads\\ExData_Plotting1")
data <- read.table(".\\data\\household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, dec = ".", stringsAsFactors = FALSE)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
subData <- data[data$Date >= "2007/02/01" & data$Date <= "2007/02/02",]
png(file = "plot1.png", width = 480, height = 480)
hist(subData$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
