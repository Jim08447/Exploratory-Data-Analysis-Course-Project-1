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


#Plot 1
png("plot1.png", width=480, height=480)
hist(Global_active_power, main="Global Active Power", col="red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()