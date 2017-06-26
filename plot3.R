## Download and unzip the dataset
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="elctricpower.zip")
unzip("elctricpower.zip")
##read and subset dataset
electric <- read.table ("household_power_consumption.txt",header=TRUE,sep=";")
Feb2007 <- subset(electric, Date== "1/2/2007" | Date=="2/2/2007")
Feb2007$Sub_metering_1<- as.numeric(as.character(Feb2007$Sub_metering_1))
Feb2007$Sub_metering_2<- as.numeric(as.character(Feb2007$Sub_metering_2))

##Covert date and time
datetime <- paste(Feb2007$Date, Feb2007$Time)
Feb2007$Time <- strptime(as.character(datetime), format="%d/%m/%Y %H:%M:%S")
Feb2007$Date <- as.Date(Feb2007$Date, format="%d/%m/%Y")

## plot and save it to a PNG file
png("plot3.png", width=480, height=480)
plot(Feb2007$Time,Feb2007$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
lines(Feb2007$Time,Feb2007$Sub_metering_1,col="black")
lines(Feb2007$Time,Feb2007$Sub_metering_2,col="red")
lines(Feb2007$Time,Feb2007$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
