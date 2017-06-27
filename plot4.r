setwd("C:/Users/Reeves/Documents/coursera/ExploratoryAnalysis/Week1")
d<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
d$datetime<-strptime(paste(d$Date,d$Time),"%d/%m/%Y %H:%M:%S")
feb<-subset(d,(d$datetime < "2007-02-03") & (d$datetime >= "2007-02-01"))
feb$Sub_metering_1<-as.numeric(as.character(feb$Sub_metering_1))
feb$Sub_metering_2<-as.numeric(as.character(feb$Sub_metering_2))
feb$Sub_metering_3<-as.numeric(as.character(feb$Sub_metering_3))
feb$Global_active_power<-as.numeric(as.character(feb$Global_active_power))
feb$Voltage<-as.numeric(as.character(feb$Voltage))
feb$Global_reactive_power<-as.numeric(as.character(feb$Global_reactive_power))

png(filename="Plot4.png")
par(mfcol = c(2, 2), mar = c(5, 4, 2, 1))
plot(feb$datetime,feb$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",xlab= NA)
plot(feb$datetime, feb$Sub_metering_1, ylab = "Energy sub metering", 
     xlab = NA, type = "l")
lines(feb$datetime, feb$Sub_metering_2, col="red")
lines(feb$datetime, feb$Sub_metering_3, col="blue")
legend("topright",c("Sub_Metering1","Sub_Metering2","Sub_Metering3"),
       lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),bty="n",cex=1)
plot(feb$datetime,feb$Voltage,type="l",
     ylab = "Voltage",xlab= "datetime")
plot(feb$datetime,feb$Global_reactive_power,type="l",
     ylab = "Global_reactive_power",xlab= "datetime")
dev.off()
