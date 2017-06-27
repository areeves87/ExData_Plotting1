setwd("C:/Users/Reeves/Documents/coursera/ExploratoryAnalysis/Week1")
d<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
d$Date<-strptime(paste(d$Date,d$Time),"%d/%m/%Y %H:%M:%S")
feb<-subset(d,(d$Date < "2007-02-03") & (d$Date >= "2007-02-01"))
feb$Global_active_power<-as.numeric(as.character(feb$Global_active_power))

png(filename="Plot2.png")
plot(feb$Date,feb$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",xlab= NA)
dev.off()
