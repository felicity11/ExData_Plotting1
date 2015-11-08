householdFile <- "./household_power_consumption.txt"

##
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(finalData$SetTime, finalData$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(finalData$SetTime, finalData$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")

#save the file to plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
