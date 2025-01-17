setwd("C:/Users/brecre01/Documents/Coursera")
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', check.names=FALSE, na.strings="?", stringsAsFactors=FALSE, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
datasm <- subset(mydata, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))
datetimeonly <- paste(as.Date(datasm$Date), datasm$Time)
datasm$Datetime <- as.POSIXct(datetimeonly)
datasm[,7]<-as.numeric(as.character(datasm[,7]))
datasm[,8]<-as.numeric(as.character(datasm[,8]))
datasm[,9]<-as.numeric(as.character(datasm[,9]))
plot(datasm$Datetime,datasm$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",yaxt="n")
axis(side=2,at=c(0,10,20,30),labels=c(0,10,20,30))
lines(datasm$Datetime,datasm$Sub_metering_2,col="red")
lines(datasm$Datetime,datasm$Sub_metering_3,col="blue")
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty="solid")
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()