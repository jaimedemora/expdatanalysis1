library(chron)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "dataset.zip"
download.file(fileUrl, filename, method="curl")
unzip(filename)
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
fepc <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]
fepc$Date_time <- strptime(paste(fepc$Date, fepc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png('plot2.png', width=480, height=480)
plot(fepc$Date_time, fepc$Global_active_power, ylab="Global Active Power(kilowatts)", xlab="", type="l")
dev.off()