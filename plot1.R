
data <-read.table("../household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

dataTrun <- data[as.Date("2007-02-01") <= as.Date(data[,"Date"],format="%d/%m/%Y"),]
dataTrun <- dataTrun[as.Date("2007-02-02") >= as.Date(dataTrun[,"Date"],format="%d/%m/%Y"),]
png(file="plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(dataTrun$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()