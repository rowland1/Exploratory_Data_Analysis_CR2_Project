setwd("C:/Users/rowland1/Desktop/Coursera_DataScience/Course4/C4P2")
getwd()

#load libraries#
#install.packages("ggplot2")#
install.packages("labeling")
library(ggplot2)
library(labeling)


#read the NEI & SCC data frames#

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 
#1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008?# 

#Subset the data for Baltimore City (baltcity)#

baltcity <- subset(NEI, NEI$fips == "24510")
baltcitytotals <- aggregate(baltcity[c("Emissions")], list(type = baltcity$type, year = baltcity$year), sum)

#Plot 3: sum total emmisions from NEI by year for all types in Baltimore City#

png('plot3.png', width = 480, height = 480)
p <- ggplot(baltcitytotals, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.5) +
  geom_smooth(alpha=.4, size=1, method="loess") +
  ggtitle("Total Emissions by Type in Baltimore City")

print(p)

dev.off()
