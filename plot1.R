#Take input of Household Power consumption file.
filepath <- "./Data/household_power_consumption.txt"
inputdata <- read.table(filepath, header = TRUE, sep = ";", dec=".", stringsAsFactors = FALSE)

#Make the Date column as Date Data type
inputdata$Date <- as.Date(inputdata$Date, format="%d/%m/%Y")

#Subset it using Date column from 2007-02-01 to 2007-02-02
subset_data <- subset(inputdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#Remove the previous file beacuse it is not needed now.
rm(inputdata)

subset_data$DateTime <- as.POSIXct(paste(as.Date(subset_data$Date), subset_data$Time))

#Do the Plot1

hist(as.numeric(subset_data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

## Saving to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
