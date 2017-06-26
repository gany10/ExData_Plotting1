## Download and unzip the dataset
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="elctricpower.zip")
unzip("elctricpower.zip")
##read and subset dataset
electric <- read.table ("household_power_consumption.txt",header=TRUE,sep=";")
Feb2007 <- subset(electric, Date== "1/2/2007" | Date=="2/2/2007")
gap <- as.numeric(as.character(Feb2007$Global_active_power))
##Covert date and time
datetime <- paste(Feb2007$Date, Feb2007$Time)
Feb2007$Time <- strptime(as.character(datetime), format="%d/%m/%Y %H:%M:%S")
Feb2007$Date <- as.Date(Feb2007$Date, format="%d/%m/%Y")

## plot and save it to a PNG file
png("plot2.png", width=480, height=480)
plot(Feb2007$Time, gap, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
