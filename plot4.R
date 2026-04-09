# 1. READ AND SUBSET (Same as Plot 1,2 and 3) 
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2. Combine Date and Time (Same as plot 2 and 3)
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subset_data$Datetime <- as.POSIXct(datetime)

# 3. OPEN PNG DEVICE (same as all others)
png("plot4.png", width=480, height=480)

# 4. SET UP THE 2x2 GRID
par(mfrow = c(2, 2)) # c(2, 2) means 2 rows and 2 columns We need this since we are plotting 4 charts in the same image


# --- PLOT 1 (Top Left): Global Active Power ---
plot(subset_data$Global_active_power ~ subset_data$Datetime, type="l", #plot Global_active_power as a function of datatime (x-axis)
     ylab="Global Active Power", xlab="")

# --- PLOT 2 (Top Right): Voltage ---
plot(subset_data$Voltage ~ subset_data$Datetime, type="l", #plot voltage as a function of time
     ylab="Voltage", xlab="datetime")

# --- PLOT 3 (Bottom Left): Energy Sub-metering ---
plot(subset_data$Sub_metering_1 ~ subset_data$Datetime, type="l", 
     ylab="Energy sub metering", xlab="")
lines(subset_data$Sub_metering_2 ~ subset_data$Datetime, col='Red')
lines(subset_data$Sub_metering_3 ~ subset_data$Datetime, col='Blue')
# Note: bty="n" removes the box around the legend to match the project example
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# --- PLOT 4 (Bottom Right): Global Reactive Power ---
plot(subset_data$Global_reactive_power ~ subset_data$Datetime, type="l", 
     ylab="Global_reactive_power", xlab="datetime")

# 5. CLOSE DEVICE
dev.off()
