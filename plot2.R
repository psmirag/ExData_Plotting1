# Load Data
inputFile <- "household_power_consumption.txt"
powerTable <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter and transform
rangeData <- powerTable[powerTable$Date %in% c("1/2/2007","2/2/2007") ,]
time <- strptime(paste(rangeData$Date, rangeData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(rangeData$Global_active_power)

# Define output and create plot
png("plot2.png", height=480,width=480)
plot(time, GAP, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# Close the file
dev.off()

  