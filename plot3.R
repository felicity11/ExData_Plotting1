setwd("C:/Users/Nikita/Desktop/Coursera-Data Science/ExploratoryDataAnalysis/Project1/ExData_Plotting1")
householdFile <- "./household_power_consumption.txt"

##
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
##
## Generating Plot 3
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", 
     col="black", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, col="blue")
legend("topright", legend=labels, col=c("black","red", "blue"), lty=1)

# save the output to plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
