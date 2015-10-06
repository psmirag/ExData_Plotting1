inputFile <- "household_power_consumption.txt"
powerTable <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
rangeData <- powerTable[powerTable$Date %in% c("1/2/2007","2/2/2007") ,]

GAP <- as.numeric(rangeData$Global_active_power)
png("plot1.png", height=480,width=480)
hist(GAP, col="red", main="Global Active Power", xlab="Power")
dev.off()