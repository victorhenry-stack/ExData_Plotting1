# Set working directory to the folder containing the data
# (Adjust this if your folder name is different)
setwd("~/ExData_Plotting1")

# 1. Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# 2. Filter for the two specific days
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 3. Handle data types
globalActivePower <- as.numeric(subset_data$Global_active_power)

# 4. Create the PNG
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()