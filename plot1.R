################################################################################
# AUTHOR: Eric Pao
# TITLE: Exploratory Data Analysis - Week 1 - Plot 1
# DATE: 01/03/2017
################################################################################

setwd("C:/Users/ep7246/Documents/Data Science Track/03 - Coursera/01 - Courses/03 - Exploratory Data Analysis/00 - Week 1")


##### Load Raw Data ####

raw <- read.table("./Electric Power Consumption/household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = F)
raw$Date <- as.Date(pw_raw$Date, format = "%d/%m/%Y")

# Subset data for 2007-02-01 to 2007-02-02 #
subset_raw <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02") 

###### Plot 1 - Global Active Power Histogram ######

subset_raw$Global_active_power <- as.numeric(subset_raw$Global_active_power)

# Create png plot #

png(filename = "plot1.png", width = 480, height = 480)
hist(subset_raw$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()


