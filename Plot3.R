
# Plot 3. "Energy sub metering" ~ datetime; Sub_metering_1, Sub_metering_2, Sub_metering_3 


EPCdataset <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
EPCdataset <- subset(EPCdataset, Date == "1/2/2007" | Date == "2/2/2007" )
EPCdataset$datetime <- strptime(paste(EPCdataset$Date, EPCdataset$Time),format="%d/%m/%Y %H:%M:%S") 


png("plot3.png", width=480, height=480)
plot(EPCdataset$datetime, EPCdataset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(EPCdataset$datetime, EPCdataset$Sub_metering_2, type="l", col="red")
lines(EPCdataset$datetime, EPCdataset$Sub_metering_3, type="l", col="blue")
legend("topleft", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()