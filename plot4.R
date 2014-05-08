data <-read.table("../household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

dataTrun <- data[as.Date("2007-02-01") <= as.Date(data[,"Date"],format="%d/%m/%Y"),]
dataTrun <- dataTrun[as.Date("2007-02-02") >= as.Date(dataTrun[,"Date"],format="%d/%m/%Y"),]
dataTrun$Date <- as.Date(dataTrun$Date,format="%d/%m/%Y")
dateTime <- as.POSIXct(paste(dataTrun$Date,dataTrun$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))
plot(dateTime,dataTrun$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="")
plot(dateTime,dataTrun$Voltage,type="l", ylab="Voltage", xlab="datetime")
plot(dateTime,dataTrun$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="")
lines(dateTime,dataTrun$Sub_metering_2,col="red")
lines(dateTime,dataTrun$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"),box.lwd = 0,box.col = "white",bg = "white")

plot(dateTime,dataTrun$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()