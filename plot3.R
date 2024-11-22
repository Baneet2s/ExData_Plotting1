file <- "D:/College/Sem 5/Data Science/Coursera/household_power_consumption.txt" 
data <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png("plot3.png", width=480, height=480)
plot(subset_data$Time, subset_data$Sub_metering_1, 
     type="l", 
     col="black", 
     xlab="Time", 
     ylab="Energy Sub Metering", 
     main="Energy Sub Metering over Time")
lines(subset_data$Time, subset_data$Sub_metering_2, col="red")
lines(subset_data$Time, subset_data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lty=1)
dev.off()