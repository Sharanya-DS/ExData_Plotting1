## Loading text file data onto a variable.
dataFile <- "./household_power_consumption.txt"

## Reading data as table from the text file.
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subsetting data for the specific dates.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting data from subSetData to feed into plot
globalActivePower <- as.numeric(subSetData$Global_active_power)

## Creating a plot with specific dimensions and labels
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab = "Frequency")

## Terminating the connection
dev.off()