#-----------------------------------------------------------------------------
#  Copyright (C) 2018  Michael F. Finch
#
#  Distributed under the terms of the MIT License.  The full license is in
#  the file LISCENCE.txt, distributed as part of this software.
#------------------------------------------------------------

plot2 <- function(){
  
  # Load Libraries
  library(dplyr)
  source("clean.R")
  
  # Get df
  df = get_clean_subset()
  png(filename = "plot2.png", width = 480, height = 480)
  plot(with(df, as.POSIXct(paste(Date, Time))), df$Global_active_power, type = "l",
       xlab = "", ylab =  "Global Active Power (kilowatts)" ) 
  dev.off()
  
}