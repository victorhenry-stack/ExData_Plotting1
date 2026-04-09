# 1. READ AND SUBSET (Same as Plot 1) 
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") cleans the data so we can use it
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #Subsets the data to use only the data range we need.

# 2. Combine Date and Time
# We create a new column that looks like "2007-02-01 00:01:00"
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subset_data$Datetime <- as.POSIXct(datetime)

# 3. OPEN THE PNG DEVICE #we need to open it to be able to plot something
png("plot2.png", width=480, height=480)

# 4. CREATE THE PLOT
# type="l" tells R to draw a LINE instead of dots
plot(subset_data$Global_active_power ~ subset_data$Datetime, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# 5. CLOSE DEVICE
dev.off()
