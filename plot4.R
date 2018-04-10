#-----------------------------------------------------------------------------
#  Copyright (C) 2018  Michael F. Finch
#
#  Distributed under the terms of the MIT License.  The full license is in
#  the file LISCENCE.txt, distributed as part of this software.
#------------------------------------------------------------

plot4 <- function(){
  
  # Load Libraries
  library(dplyr)
  source("clean.R")
  
  # Get df
  df = get_clean_subset()
  
  # Set up multi-plot
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfcol = c(2,2), mar = c(4,3,0.5,0))
  
  #upper right
  plot(with(df, as.POSIXct(paste(Date, Time))), df$Global_active_power, type = "l",
       xlab = "", ylab =  "Global Active Power (kilowatts)" ) 
  
  #lower Right
  plot(with(df, as.POSIXct(paste(Date, Time))), df$Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  points(with(df, as.POSIXct(paste(Date, Time))), df$Sub_metering_2, col = "red", type = "l" )
  points(with(df, as.POSIXct(paste(Date, Time))), df$Sub_metering_3, col = "blue", type = "l" )
  legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
  
  #upper left
  plot(with(df, as.POSIXct(paste(Date, Time))), df$Voltage, type = "l",
       xlab = "datetime", ylab =  "Voltage")
  
  #lower left
  plot(with(df, as.POSIXct(paste(Date, Time))), df$Global_reactive_power, type = "l",
       xlab = "datetime", ylab =  "Voltage")

  dev.off()
}