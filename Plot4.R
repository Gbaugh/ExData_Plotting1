
# Plot 4. a) "Global Active Power" b)Voltage;, c)"Energy sub metering"; d) Global_reactive_power; ~ datetime


EPCdataset <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
EPCdataset <- subset(EPCdataset, Date == "1/2/2007" | Date == "2/2/2007" )
EPCdataset$datetime <- strptime(paste(EPCdataset$Date, EPCdataset$Time),format="%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 
plot(EPCdataset$datetime, EPCdataset$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(EPCdataset$datetime, EPCdataset$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(EPCdataset$datetime, EPCdataset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(EPCdataset$datetime, EPCdataset$Sub_metering_2, type="l", col="red")
lines(EPCdataset$datetime, EPCdataset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(EPCdataset$datetime, EPCdataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 
