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

png("plot17.png", height=480, width=480)
plot(fepc$Date_time, fepc$Sub_metering_1, , xlab=" ", ylab="Energy and submetering", type="l")
lines(fepc$Date_time, fepc$Sub_metering_2, type="l", col="red")
lines(fepc$Date_time, fepc$Sub_metering_3, type="l", col="blue")
dev.off()
