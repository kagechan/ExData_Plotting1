plot2 <- function() {
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
  plot(active_power$Date, active_power$Global_active_power,
       main="Global Active Power", xlab ="", ylab="Global Active Power (kilowatts)", type="l")
  dev.copy(png,"plot2.png")
  dev.off()
}