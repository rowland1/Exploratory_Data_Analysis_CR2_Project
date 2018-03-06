setwd("C:/Users/rowland1/Desktop/Coursera_DataScience/Course4/C4P2")
getwd()

#read the NEI & SCC data frames#

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?# 

#Subset the data for Baltimore City (baltcity)#

baltcity <- subset(NEI, NEI$fips == "24510")
baltcitytotals <- aggregate(Emissions ~ year, baltcity, sum)

#Plot 2: sum total emmisions from NEI by year for all categories in Baltimore City#

png('plot2.png', width = 480, height = 480)
plot(baltcitytotals$year, baltcitytotals$Emissions, type = "l", main = "Total Emmisions from PM2.5 in Baltimore City, MD", 
     xlab = "Year", ylab = "Emissions")
dev.off ()
