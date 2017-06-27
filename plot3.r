setwd("C:/Users/Reeves/Documents/coursera/ExploratoryAnalysis/Week1")
d<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
d$Date<-strptime(paste(d$Date,d$Time),"%d/%m/%Y %H:%M:%S")
feb<-subset(d,(d$Date < "2007-02-03") & (d$Date >= "2007-02-01"))
feb$Sub_metering_1<-as.numeric(as.character(feb$Sub_metering_1))
feb$Sub_metering_2<-as.numeric(as.character(feb$Sub_metering_2))
feb$Sub_metering_3<-as.numeric(as.character(feb$Sub_metering_3))


png(filename="Plot3.png")
plot(feb$Date, feb$Sub_metering_1, ylab = "Energy sub metering", 
     xlab = NA, type = "l")
lines(feb$Date, feb$Sub_metering_2, col="red")
lines(feb$Date, feb$Sub_metering_3, col="blue")
legend("topright",c("Sub_Metering1","Sub_Metering2","Sub_Metering3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()
