#So, lets first figure out what the data looks like.
#data <- read.table("household_power_consumption.txt")
#str(data) --> only 1 variable and everything returning as chr (strings), so I need to format it before moving on.
# from the info of str(data), the data is being separated by ";" not spaces which is R default, so I need to parse sep = ";" as a variable to divide the data accurately.

#data <- read.table("household_power_consumption.txt", sep=";")
#now I have 9 variables instead of just 1, but all data is still stored as a string (chr) , so I can't do analysis on it, tried to run summary(data) and it failed.
#step 2 would be transforming data for everything that is not a date into a number format, after a ton of investigating, this is happening because for missing data some values are being substituted by "?" which makes the remaining columns be treated as text, and not as numbers, lets get rid of it.

#data <- read.table("household_power_consumption.txt",sep=";", na.strings="?")
#so I got rid of the ?, but data is still not reading, apparently its because I forgot to add header = true, which makes R understand that the first row of chr is the head, not values.
#data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")


# 1. create a variable to read the data in a usable format.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#ok, seems to be workable data now, lets filter the data to get only data for the period we need to analyse.


# 2. Filter the data for the required period of time.
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#this was just a lot of trial and error, but its pretty straight forward once the data is organized.

# 3. Create the PNG
png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()