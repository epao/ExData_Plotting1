################################################################################
# AUTHOR: Eric Pao
# TITLE: Exploratory Data Analysis - Week 1 - Plot 2
# DATE: 01/03/2017
################################################################################

setwd("C:/Users/ep7246/Documents/Data Science Track/03 - Coursera/01 - Courses/03 - Exploratory Data Analysis/00 - Week 1")


##### Load Raw Data ####

raw <- read.table("./Electric Power Consumption/household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = F)
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")

# Subset data for 2007-02-01 to 2007-02-02 #
subset_raw <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02") 

###### Plot 2 - Global Active Power Over Time ######

# Convert to appropriate format #
subset_raw$Global_active_power <- as.numeric(subset_raw$Global_active_power)
subset_raw$dateTime <- paste(subset_raw$Date,subset_raw$Time)
subset_raw$dateTime <- strptime(subset_raw$dateTime, "%Y-%m-%d %H:%M:%S")

# Create png plot #

png(filename = "plot2.png", width = 480, height = 480)
plot(subset_raw$dateTime,subset_raw$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()


