plot1 <- function() {
  ## Read household_power_consumption data
  ## The separator is semicolon, instead of comma.
  ## Missing data are described as "?" character, so I specified the 
  ## na.strings attribute.
  csv <- read.csv("household_power_consumption.txt",sep=";",
                  colClasses=c("character", "character", "numeric","numeric",
                               "numeric","numeric","numeric","numeric","numeric"),
                  na.strings=c("?"))
  
  active_power <- csv[csv$Date == "1/2/2007" | csv$Date == "2/2/2007",]$Global_active_power
  hist(active_power, col="red",
       main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.copy(png,"plot1.png")
  dev.off()
}