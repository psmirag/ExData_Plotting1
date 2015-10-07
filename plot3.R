# Load Data
inputFile <- "household_power_consumption.txt"
powerTable <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter and transform
rangeData <- powerTable[powerTable$Date %in% c("1/2/2007","2/2/2007") ,]
time <- strptime(paste(rangeData$Date, rangeData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(rangeData$Global_active_power)
subM1 <- as.numeric(rangeData$Sub_metering_1)
subM2 <- as.numeric(rangeData$Sub_metering_2)
subM3 <- as.numeric(rangeData$Sub_metering_3)

# Define output and create plot
png("plot3.png", height=480,width=480)
plot(time, subM1, ylab="Energy Sub metering", xlab="", type="l")
lines(time, subM2, col="red", type="l")
lines(time, subM3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close the file
dev.off()