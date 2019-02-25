
# Plot 2. "Global Active Power" 


EPCdataset <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
EPCdataset <- subset(EPCdataset, Date == "1/2/2007" | Date == "2/2/2007" )
EPCdataset$datetime <- strptime(paste(EPCdataset$Date, EPCdataset$Time),format="%d/%m/%Y %H:%M:%S") 


png("plot2.png", width=480, height=480)
plot(EPCdataset$datetime, EPCdataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

