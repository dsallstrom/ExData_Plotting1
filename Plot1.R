## Read data file into R
## Manually downloaded zip file from coursera website
dta <- read.table("household_power_consumption.txt", sep=";", header=TRUE)


## Check and edit data. I will use this code in all files.
## Converts vars (just ones I care about) to numeric, creates a datetime var, and subsets correct days.
dta$Global_active_power <- as.numeric(as.character(dta$Global_active_power))
dta$Sub_metering_1 <- as.numeric(as.character(dta$Sub_metering_1))
dta$Sub_metering_2 <- as.numeric(as.character(dta$Sub_metering_2))
dta$Sub_metering_3 <- as.numeric(as.character(dta$Sub_metering_3))
dta$Volage <- as.numeric(as.character(dta$Voltage))
dta$Date <- as.character(dta$Date)
dta$Time <- as.character(dta$Time)
dta$Global_reactive_power <- as.numeric(as.character(dta$Global_reactive_power))
dta$DateTime <- as.POSIXct(paste(dta$Date, dta$Time), format="%d/%m/%Y %H:%M:%S")
dta$DateCheck <- as.Date(dta$Date, format="%d/%m/%Y")
dta <- subset(dta, DateCheck == as.Date("2007-02-01") | DateCheck == as.Date("2007-02-02"))


## Create the first plot
png(filename="Plot1")
hist(dta$Global_active_power, col="red1", xlab="Global Active Power (kilowatts)", main=NULL, 
     ylab="Frequency", axes=FALSE, labels=FALSE)
axis(1, at=seq(0, 6, by=2))
axis(2, at=seq(0, 1200, by=200))
title("Global Active Power")
dev.off()