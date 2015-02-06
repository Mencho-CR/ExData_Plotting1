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

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

plot(house_f$datetime, house_f$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)")

plot(house_f$datetime, house_f$Sub_metering_1, type="n", xlab="", ylab= "Energy SubMetering")
lines(house_f$datetime, house_f$Sub_metering_1, type="l")
lines(house_f$datetime, house_f$Sub_metering_2, type="l", col = "red")
lines(house_f$datetime, house_f$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, col= c("black", "red", "blue"), cex=0.7)

plot(house_f$datetime, house_f$Voltage, type="l", xlab="datetime", ylab= "Voltage")

plot(house_f$datetime, house_f$Global_reactive_power, type="l", xlab="datetime", ylab= "Global Reactive Power")

dev.off()
