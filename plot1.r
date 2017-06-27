setwd("C:/Users/Reeves/Documents/coursera/ExploratoryAnalysis/Week1")
d<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
d$Date<-as.Date(d$Date,"%d/%m/%Y")
feb<-subset(d,(d$Date < "2007-02-03") & (d$Date >= "2007-02-01"))
feb$Global_active_power<-as.numeric(as.character(feb$Global_active_power))

png(filename="Plot1.png")
hist(feb$Global_active_power,ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)",
     main="Global Active Power",col="red")
dev.off()
