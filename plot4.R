## Loading text file data onto a variable.
dataFile <- "./household_power_consumption.txt"

## Reading data as table from the text file.
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subsetting data for the specific dates.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting data from subSetData to feed into plot
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
                     format="%d/%m/%Y %H:%M:%S")
voltage<- as.numeric(subSetData$Voltage)
globalReactivePower<- as.numeric(subSetData$Global_reactive_power)

## Creating a plot with specific dimensions
png("plot4.png", width=480, height=480)

## Using par=mfrow for creating multiple plots rowwise
par(mfrow=c(2,2))

## Plot for Global Active power  vs DateTime
plot(dateTime, globalActivePower, type="l", 
     xlab = "", ylab="Global Active Power (kilowatts)")


## Plot for Voltage vs DateTime
plot(dateTime, voltage, type="l", ylab="Voltage")


## Plot for DateTime vs Energy sub_metering_1, sub_metering_2 and sub_metering_3
plot(dateTime, as.numeric(as.character(subSetData$Sub_metering_1)), type="l", xlab="", 
     ylab="Energy sub metering", ylim=c(0,40))
lines(dateTime, as.numeric(as.character(subSetData$Sub_metering_2)), col="red")
lines(dateTime, as.numeric(as.character(subSetData$Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                      "Sub_metering_2", 
                                                                      "Sub_metering_3" ))

## Plot for Global Reactive power vs DateTime
plot(dateTime, globalReactivePower, type="l", ylab="Global_reactive_power",  ylim=c(0.0,0.5))



## Terminating the connection
dev.off()
