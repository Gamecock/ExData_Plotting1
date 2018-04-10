#-----------------------------------------------------------------------------
#  Copyright (C) 2018  Michael F. Finch
#
#  Distributed under the terms of the MIT License.  The full license is in
#  the file LISCENCE.txt, distributed as part of this software.
#------------------------------------------------------------

plot3 <- function(){
  
  # Load Libraries
  library(dplyr)
  source("clean.R")
  
  # Get df
  df = get_clean_subset()
  png(filename = "plot3.png", width = 480, height = 480)
  plot(with(df, as.POSIXct(paste(Date, Time))), df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(with(df, as.POSIXct(paste(Date, Time))), df$Sub_metering_2, col = "red", type = "l" )
  points(with(df, as.POSIXct(paste(Date, Time))), df$Sub_metering_3, col = "blue", type = "l" )
  legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
  dev.off()
  
}