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
volt <- as.numeric(rangeData$Voltage)
GRP <- as.numeric(rangeData$Global_reactive_power)

# Define output and create multipanel
png("plot4.png", height=480,width=480)
par(mfrow = c(2,2)) 

# Plot 1
plot(time, GAP, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# Plot 2
plot(time, volt, xlab="datetime", ylab="Voltage", type="l")

# Plot 3
plot(time, subM1, ylab="Energy Sub metering", xlab="", type="l")
lines(time, subM2, col="red", type="l")
lines(time, subM3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Plot 4
plot(time, GRP, xlab="datetime", ylab="Global_reactive_power", type="l")

# Close the file
dev.off()