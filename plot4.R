makePlot4 <- function(){
  
  #read in file and subset to chosen days
  datafile <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
  subdata <- subset(datafile, Date=="1/2/2007" | Date=="2/2/2007")
  
  #make a date time column
  subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  #open png device
  png(file="plot4.png", width=600, height=600)
  
  #set the params to draw all the graphs together
  par(mfrow=c(2,2))
  
  #make the first plot
  plot(subdata$DateTime, subdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  
  #make the second plot
  plot(subdata$DateTime, subdata$Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  #make the third plot
  max1 <- max(subdata$Sub_metering_1)
  plot(subdata$DateTime, subdata$Sub_metering_1, type="l", col="black", ylim=c(0,max1), xlab="", ylab="Energy sub metering")
  par(new=T)
  plot(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red", ylim=c(0,max1), xlab="", ylab="")
  par(new=T)
  plot(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue", ylim=c(0,max1), xlab="", ylab="")
  par(new=F)
  
  #add a legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
  
  #make the fourth plot
  plot(subdata$DateTime, subdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  
  #close the device
  dev.off()
  
}