# 1. READ AND SUBSET (Same as Plot 1) 
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2. Combine Date and Time (Same as plot 2)
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subset_data$Datetime <- as.POSIXct(datetime)

# 3. OPEN PNG DEVICE (Same as plot 1 and 2)
png("plot3.png", width=480, height=480)

# 4. BUILD THE PLOT LAYER BY LAYER
# Layer 1: Sub_metering_1 (Black line)
plot(subset_data$Sub_metering_1 ~ subset_data$Datetime, type="l", #plot sub_metering_1 as a function of datetime
     ylab="Energy sub metering", xlab="")

# Layer 2: Sub_metering_2 (Red line)
lines(subset_data$Sub_metering_2 ~ subset_data$Datetime, col='Red')#plot sub_metering_2 as a function of datetime 

# Layer 3: Sub_metering_3 (Blue line)
lines(subset_data$Sub_metering_3 ~ subset_data$Datetime, col='Blue')#plot sub_metering_3 as a function of datetime 

# 5. ADD THE LEGEND
# lty=1 tells R to show a line in the legend, lwd=2 makes it readable
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 6. CLOSE DEVICE
dev.off()
