


plot1 <- function(){

  print("Loading data ..")
  hdd <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
  library(lubridate)
  hdd$Date <- dmy_hms(paste(hdd[,1],hdd[,2],sep = " "))
  hdd$Time <- NULL
  print("Plotting histogram ..")
  hd2 <- hdd[hdd$Date > ymd("2007-01-31") & hdd$Date < ymd("2007-02-03"),]
  png("plot1.png", width=480, height=480)
  hist(hd2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim = c(0,1200) )
  dev.off()
  
}

