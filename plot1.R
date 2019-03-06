## Code for generating plot 1.
## First load the raw data this is stored in the variable rawData
rawData <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

## Transform the Date column to the date class
rawData$Date <- as.Date(rawData$Date, format = "%d/%m/%Y")
str(rawData)


## check the structure of the data frame to ensure that the transformation has indeed 
## taken place
str(rawData)

## I noticed that there are other transformations that have to takeplace for plotting to happen
rawData$Global_active_power   = as.double(rawData$Global_active_power)
rawData$Global_reactive_power = as.double(rawData$Global_reactive_power)
rawData$Voltage               = as.double(rawData$Voltage)
rawData$Global_intensity      = as.double(rawData$Global_intensity)
rawData$Sub_metering_1        = as.double(rawData$Sub_metering_1)
rawData$Sub_metering_2        = as.double(rawData$Sub_metering_2)
rawData$Sub_metering_3        = as.double(rawData$Sub_metering_3)
rawData$Time_Stamp            = paste(rawData$Date,rawData$Time)
rawData$Time_Stamp            = as.POSIXct(rawData$Time_Stamp)

## We can now filter only the relevant dates
rawData <- subset(rawData, Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))

## now we can plot
## open a png device and save the file
png(filename = "plot1.png", width = 480, height = 480)
with(rawData, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)"))
dev.off()

