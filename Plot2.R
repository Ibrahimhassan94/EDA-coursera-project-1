#plot 2
HHdata <- read.table("household_power_consumption.txt",sep=";")
names(HHdata) <- c("Date","Time","Global_active_power","Global_reactive_power")
subHHdata <- subset(HHdata,HHdata$Date=="1/2/2007" | HHdata$Date =="2/2/2007")
subHHdata$Date <- as.Date(subHHdata$Date, format="%d/%m/%Y")
subHHdata$Time <- strptime(subHHdata$Time, format="%H:%M:%S")
subHHdata[1:1440,"Time"] <- format(subHHdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subHHdata[1441:2880,"Time"] <- format(subHHdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png(file="plot2.png",width = 480, height = 480)
plot(subHHdata$Time,as.numeric(as.character(subHHdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()