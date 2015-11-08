


plot4 <- function(){

  print("Loading data ..")
  hdd <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
  library(lubridate)
  hdd$Date <- dmy_hms(paste(hdd[,1],hdd[,2],sep = " "))
  hdd$Time <- NULL
  print("Plotting histogram ..")
  hd2 <- hdd[hdd$Date > ymd("2007-01-31") & hdd$Date < ymd("2007-02-03"),]
  hd2 <- hd2[weekdays(hd2$Date,TRUE) == "Thu" | weekdays(hd2$Date,TRUE) == "Fri" | weekdays(hd2$Date,TRUE) == "Sat",]
  
  
  png("plot4.png", width=800, height=800)
  par(mfrow = c(2, 2))
  
  plot(hd2$Date,hd2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

  plot(hd2$Date,hd2$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
  
  
  plot(hd2$Date,hd2$Sub_metering_1,type = "l",
       xlab = "",ylab = "Energy sub metering")
  lines(hd2$Date,hd2$Sub_metering_2,type = "l",col="red")
  lines(hd2$Date,hd2$Sub_metering_3,type = "l",col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  plot(hd2$Date,hd2$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global Reactive Power")
  
  
  dev.off()
}

