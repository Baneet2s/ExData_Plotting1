file <- "D:/College/Sem 5/Data Science/Coursera/household_power_consumption.txt" 
data <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png("plot2.png", width=480, height=480)
plot(subset_data$Time, subset_data$Global_active_power, 
     type="l", 
     xlab="Time", 
     ylab="Global Active Power (kilowatts)", 
     main="Global Active Power over Time")
dev.off()