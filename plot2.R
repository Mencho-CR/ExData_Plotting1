house <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?")

library(plyr)
library(dplyr)
library(lubridate)



house_tbl <- tbl_df(house)
house_f <- house_tbl

house_f$Date <- dmy(house_f$Date)
house_f$Date <- as.Date(house_f$Date)

house_f$datetime <- paste(house_f$Date, house_f$Time)
house_f$datetime <- ymd_hms(house_f$datetime)


house_f <- filter(house_f, Date == "2007-02-01" |Date =="2007-02-02")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(house_f$datetime, house_f$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)")
dev.off()