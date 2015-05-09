plot3 <- function() {
  ## Read household_power_consumption data
  ## The separator is semicolon, instead of comma.
  ## Missing data are described as "?" character, so I specified the 
  ## na.strings attribute.
  csv <- read.csv("household_power_consumption.txt",sep=";",
                  colClasses=c("character", "character", "numeric","numeric",
                               "numeric","numeric","numeric","numeric","numeric"),
                  na.strings=c("?"))
  
  ## Extract the data whose date is either 1/2/2007 or 2/2/2007
  active_power <- csv[csv$Date == "1/2/2007" | csv$Date == "2/2/2007",]
  
  ## So far, Date and Time field are formatted as characters.
  ## So, these fields must be converted into POSIXct.
  active_power$Date = as.POSIXct(paste(active_power$Date, active_power$Time), 
                                    format = "%d/%m/%Y %T")
  ## plot the data
  cols <- c("black", "red", "blue")
  xvals <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  ## Hmmm... I couldn't retrieve data from data frame with loop...

  plot(active_power$Date, active_power$Sub_metering_1, col = cols[1],
       type="l",main="", xlab="", ylab="Energy sub metering")
  lines(active_power$Date, active_power$Sub_metering_2, col = cols[2])
  lines(active_power$Date, active_power$Sub_metering_3, col = cols[3])
  ## make legend
  legend("topright", lty= 1, col=cols, legend=xvals)
  dev.copy(png,"plot3.png")
  dev.off()
}