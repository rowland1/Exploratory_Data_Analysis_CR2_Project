setwd("C:/Users/rowland1/Desktop/Coursera_DataScience/Course4/C4P2")
getwd()

#load libraries#
#install.packages("ggplot2")#
#install.packages("labeling")
library(ggplot2)
library(labeling)


#read the NEI & SCC data frames#

NEI <- readRDS("summarySCC_PM25.rds")
SCC2 <- readRDS("Source_Classification_Code.rds")

#Question: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?#

vehiclesubset <- grep("vehicle", SCC2$EI.Sector,value = T, ignore.case = T )
SCCvehiclesubset <- subset(SCC2, SCC2$EI.Sector %in% vehiclesubset, select = SCC)
baltcity <- subset(NEI, NEI$fips == "24510")
NEIvehiclesubset <- subset(baltcity, baltcity$SCC %in% SCCvehiclesubset$SCC)
vehicleltotals <- aggregate(NEIvehiclesubset[c("Emissions")], list(year = NEIvehiclesubset$year),sum)


#Plot 5: sum total vehicle emmisions for U.S.#

png("Plot5.png", width = 480, height = 480)
plot(vehicleltotals$year, vehicleltotals$Emissions, type = "l", 
     main = "Total Vehicle Emmisions in Baltimore City", 
     xlab = "Year", ylab = "Emissions")

dev.off()
