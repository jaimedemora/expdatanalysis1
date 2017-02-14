library(chron)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "dataset.zip"
download.file(fileUrl, filename, method="curl")
unzip(filename)
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
fepc <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]
fepc$Date_time <- strptime(paste(fepc$Date, fepc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

fepc$Sub_metering_1 <- as.numeric(as.character(fepc$Sub_metering_1))
fepc$Sub_metering_2 <- as.numeric(as.character(fepc$Sub_metering_2))
fepc$Sub_metering_3 <- as.numeric(as.character(fepc$Sub_metering_3))
fepc$Voltage <- as.numeric(as.character(fepc$Voltage))
fepc$Global_reactive_power <- as.numeric(as.character(fepc$Global_reactive_power))

png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(fepc$Date_time, fepc$Global_active_power, ylab="Global Active Power(kilowatts)", xlab="", type="l")
plot(fepc$Date_time, fepc$Voltage, ylab="Voltage", xlab="datetime", type="l")
plot(fepc$Date_time, fepc$Sub_metering_1, , xlab=" ", ylab="Energy and submetering", type="l")
lines(fepc$Date_time, fepc$Sub_metering_2, type="l", col="red")
lines(fepc$Date_time, fepc$Sub_metering_3, type="l", col="blue")
plot(fepc$Date_time, fepc$Global_reactive_power, ylab="Global Active Power(kilowatts)", xlab="", type="l")
dev.off()
