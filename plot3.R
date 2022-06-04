setwd("G:/Data Science with R-Coursera/Exploratory Data Analysis")
library(data.table)

# Reading and subsetting the required data

main_data<-fread("household_power_consumption.txt", stringsAsFactors = FALSE)
plot_data <- subset(main_data, main_data$Date=="1/2/2007" | 
                      main_data$Date=="2/2/2007")

# Assigning the right class to data variables
datetime <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(plot_data$Global_active_power)
Global_reactive_power <- as.numeric(plot_data$Global_reactive_power)
Voltage <- as.numeric(plot_data$Voltage)
Global_intensity <- as.numeric(plot_data$Global_intensity)
Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)


#Plot 3
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l",xlab = "",
     ylab ="Energy Sub Metering")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3,type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), lty = 1,
       lwd = 2.5, col = c("black", "red", "blue"))
dev.off()