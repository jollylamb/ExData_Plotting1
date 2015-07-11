makePlot2 <- function(){
  #read in file and subset to chosen days
  datafile <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
  subdata <- subset(datafile, Date=="1/2/2007" | Date=="2/2/2007")
  
  #make a date time column
  subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  #open png device
  png(file="plot2.png")
  
  #make the plot
  plot(subdata$DateTime, subdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  #close the device
  dev.off()
}