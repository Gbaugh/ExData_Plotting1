
# Plot 1. "Global Active Power" : frequency~Global Active Power (kilowatts)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp1 <- tempfile()
temp2 <- tempfile()

download.file(url, temp1)
unzip(zipfile = temp1, exdir = temp2)


EPCdataset <- read.delim2(file.path(temp2, "household_power_consumption.txt"), header = TRUE, sep = ";", dec = ".", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
EPCdataset <- subset(EPCdataset, Date == "1/2/2007" | Date == "2/2/2007" )
EPCdataset$datetime <- strptime(paste(EPCdataset$Date, EPCdataset$Time),format="%d/%m/%Y %H:%M:%S") 


png("plot1.png", width=480, height=480)
hist(EPCdataset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

unlink(c(temp1, temp2))

