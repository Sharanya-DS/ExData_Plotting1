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

## Creating a plot with specific dimensions and labels
png("plot2.png", width=480, height=480)

## xlab value is "", so that no xlabel is printed. type = L for line graph
plot(dateTime, globalActivePower, type="l", 
     xlab = "", ylab="Global Active Power (kilowatts)")

## Terminating the connection
dev.off()
