## Download and unzip the dataset
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="elctricpower.zip")
unzip("elctricpower.zip")
##read and subset dataset
electric <- read.table ("household_power_consumption.txt",header=TRUE,sep=";")
Feb2007 <- subset(electric, Date== "1/2/2007" | Date=="2/2/2007")
## plot and save it to a PNG file
png("plot1.png", width=480, height=480)
gap <- as.numeric(as.character(Feb2007$Global_active_power))
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

