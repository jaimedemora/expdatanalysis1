library(chron)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "dataset.zip"
download.file(fileUrl, filename, method="curl")
unzip(filename)
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
fepc <- subset(epc, Date == "2/1/2007" | Date == "2/2/2007")
fepc$Date = as.Date(fepc$Date, '%d/%m/%Y')

fepc$Global_active_power <- as.numeric(as.character(fepc$Global_active_power))
fepc$Global_reactive_power <- as.numeric(as.character(fepc$Global_reactive_power))
fepc$Time <- chron(time=fepc$Time)



png('plot1.png', width=480, height=480)
hist(fepc$Global_active_power, xlab="Global Active Power(kilowatts)", col="red", main="Global Active Power")
dev.off()