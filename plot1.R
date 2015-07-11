makePlot1 <- function(){
  
  #read in file and subset to chosen days
  datafile <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
  subdata <- subset(datafile, Date=="1/2/2007" | Date=="2/2/2007")
  
  #open png device
  png(file="plot1.png")

  #make the plot
  hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  #close the device
  dev.off()
}