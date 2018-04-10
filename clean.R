#-----------------------------------------------------------------------------
#  Copyright (C) 2018  Michael F. Finch
#
#  Distributed under the terms of the MIT License.  The full license is in
#  the file LISCENCE.txt, distributed as part of this software.
#-----------------------------------------------------------------------------

get_clean_subset <- function(){
  
  #Load libraries
#  suppressWarnings(library("lubridate"))

  #Return data if cached  
  if(file.exists("data/hpc.csv")){
    print("Returning cached data.")
    return( as_tibble(read.csv(file = "data/hpc.csv")))
  }
  # Download and unzip source data
  if(!dir.exists("data")) dir.create("data")
  if(!file.exists("data/household_power_consumption.txt")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data/household_power_consumption.zip")
    unzip("data/household_power_consumption.zip", exdir = "data")
  }
  #Load downloaded data and filter
  data = as_tibble(read.table(file = "data/household_power_consumption.txt",header = TRUE, sep = ";" ,
                              na.strings = "?", colClasses = c("character", "character", "numeric", 
                              "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))) %>%
                              mutate(Date = as.Date(Date, "%d/%m/%Y")) %>% filter(Date == as.Date("2007-02-01")|
                              Date == as.Date("2007-02-02"))
  write.csv(data, file = "data/hpc.csv")
  return(data)
}  
  