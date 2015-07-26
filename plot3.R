makePlot3 <- function(){
  #read in file and subset to chosen days
  datafile <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
  subdata <- subset(datafile, Date=="1/2/2007" | Date=="2/2/2007")
  
  #make a date time column
  subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  #open png device
  png(file="plot3.png")
  
  #make the plot
  max1 <- max(subdata$Sub_metering_1)
  plot(subdata$DateTime, subdata$Sub_metering_1, type="l", col="black", ylim=c(0,max1), xlab="", ylab="Energy sub metering")
  lines(subdata$DateTime, subdata$Sub_metering_2, col="red")
  lines(subdata$DateTime, subdata$Sub_metering_3, col="blue")
  
  #add a legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
  
  #close the device
  dev.off()
}