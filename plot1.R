setwd("C:/Users/rowland1/Desktop/Coursera_DataScience/Course4/C4P2")
getwd()

#read the NEI & SCC data frames#

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?# 
#Plot 1: sum total emmisions from NEI by year for all categories#

NEItotals <- aggregate(Emissions ~ year, NEI, sum)
png('plot1.png', width = 480, height = 480)
plot(NEItotals$year, NEItotals$Emissions/10^6, type = "l", main = "Total Emmisions from PM2.5 in U.S.", 
     xlab = "Year", ylab = "Emissions (10^6)")
dev.off ()

