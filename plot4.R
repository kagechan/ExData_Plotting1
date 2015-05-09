plot4 <- function() {
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
  
  par(mfrow = c(2,2), oma=c(0,0,0,0), mar=c(1,4,1,1))
  
  ## So far, Date and Time field are formatted as characters.
  ## So, these fields must be converted into POSIXct.
  active_power$Date = as.POSIXct(paste(active_power$Date, active_power$Time), 
                                    format = "%d/%m/%Y %T")
  ## plot the data
  with(active_power, {
    plot(Date, Global_active_power, main="", xlab="", ylab="Global Active Power", type="l")
    plot(Date, Voltage, main="", xlab="", type="l")
    
    cols <- c("black", "red", "blue")
    xvals <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
    ## Hmmm... I couldn't retrieve data from data frame with loop...
    plot(Date, Sub_metering_1, col = cols[1],
        type="l",main="", xlab="", ylab="Energy sub metering")
    lines(Date, Sub_metering_2, col = cols[2])
    lines(Date, Sub_metering_3, col = cols[3])
    ## make legend
    legend("topright", lty= 1, col=cols, legend=xvals, bty="n")
    plot(Date, Global_reactive_power, main="", ylab="Global Reactive Power", type="l")
  })
  dev.copy(png,"plot4.png")
  dev.off()
}