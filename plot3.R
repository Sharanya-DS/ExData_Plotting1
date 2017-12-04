## Loading text file data onto a variable.
dataFile <- "./household_power_consumption.txt"

## Reading data as table from the text file.
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subsetting data for the specific dates.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting data from subSetData to feed into plot
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
                     format="%d/%m/%Y %H:%M:%S")

## Creating a plot with specific dimensions
png("plot3.png", width=480, height=480)

## xlab value is "", so that no xlabel is printed. type = L for line graph
##  using lines(), adding aditional lines of sub_metering_2 and sub_metering_3
plot(dateTime, as.numeric(as.character(subSetData$Sub_metering_1)), type="l", xlab="", 
     ylab="Energy sub metering", ylim=c(0,40))
lines(dateTime, as.numeric(as.character(subSetData$Sub_metering_2)), col="red")
lines(dateTime, as.numeric(as.character(subSetData$Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                      "Sub_metering_2", 
                                                                      "Sub_metering_3" ))

## Terminating the connection
dev.off()
