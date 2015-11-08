


plot2 <- function(){

  print("Loading data ..")
  hdd <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
  library(lubridate)
  hdd$Date <- dmy_hms(paste(hdd[,1],hdd[,2],sep = " "))
  hdd$Time <- NULL
  print("Plotting histogram ..")
  hd2 <- hdd[hdd$Date > ymd("2007-01-31") & hdd$Date < ymd("2007-02-03"),]
  hd2 <- hd2[weekdays(hd2$Date,TRUE) == "Thu" | weekdays(hd2$Date,TRUE) == "Fri" | weekdays(hd2$Date,TRUE) == "Sat",]
  png("plot2.png", width=480, height=480)
  plot(hd2$Date,hd2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
  dev.off()
  
}

