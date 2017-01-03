################################################################################
# AUTHOR: Eric Pao
# TITLE: Exploratory Data Analysis - Week 1 - Plot 3
# DATE: 01/03/2017
################################################################################

setwd("C:/Users/ep7246/Documents/Data Science Track/03 - Coursera/01 - Courses/03 - Exploratory Data Analysis/00 - Week 1")


##### Load Raw Data ####

raw <- read.table("./Electric Power Consumption/household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = F)
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")

# Subset data for 2007-02-01 to 2007-02-02 #
subset_raw <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02") 

###### Plot 3 - Energy Sub Metering Over Time ######

# Convert to appropriate format #
subset_raw$Sub_metering_1 <- as.numeric(subset_raw$Sub_metering_1)
subset_raw$Sub_metering_2 <- as.numeric(subset_raw$Sub_metering_2)
subset_raw$Sub_metering_3 <- as.numeric(subset_raw$Sub_metering_3)
subset_raw$dateTime <- paste(subset_raw$Date,subset_raw$Time)
subset_raw$dateTime <- strptime(subset_raw$dateTime, "%Y-%m-%d %H:%M:%S")

# Create png plot #

png(filename = "plot3.png", width = 480, height = 480)
plot(subset_raw$dateTime,subset_raw$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col = "black")
lines(subset_raw$dateTime,subset_raw$Sub_metering_2,col = "red")
lines(subset_raw$dateTime,subset_raw$Sub_metering_3,col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

