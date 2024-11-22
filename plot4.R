file <- "D:/College/Sem 5/Data Science/Coursera/household_power_consumption.txt" 
data <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(subset_data$Time, subset_data$Global_active_power, 
     type="l", 
     xlab="Time", 
     ylab="Global Active Power (kilowatts)", 
     main="Global Active Power")
plot(subset_data$Time, subset_data$Voltage, 
     type="l", 
     xlab="Time", 
     ylab="Voltage (volt)", 
     main="Voltage")
plot(subset_data$Time, subset_data$Global_intensity, 
     type="l", 
     xlab="Time", 
     ylab="Global Intensity (amps)", 
     main="Global Intensity")
plot(subset_data$Time, subset_data$Sub_metering_1, 
     type="l", 
     col="black", 
     xlab="Time", 
     ylab="Energy Sub Metering", 
     main="Energy Sub Metering")
lines(subset_data$Time, subset_data$Sub_metering_2, col="red")
lines(subset_data$Time, subset_data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lty=1)
dev.off()