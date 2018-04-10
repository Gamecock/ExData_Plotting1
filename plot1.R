#-----------------------------------------------------------------------------
#  Copyright (C) 2018  Michael F. Finch
#
#  Distributed under the terms of the MIT License.  The full license is in
#  the file LISCENCE.txt, distributed as part of this software.
#------------------------------------------------------------

plot1 <- function(){

# Load Libraries
  library(dplyr)
  source("clean.R")
  
# Get df
  df = get_clean_subset()
  png(filename = "plot1.png", width = 480, height = 480)
  hist(df$Global_active_power, breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
  }