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

#Question: Has Baltimore City or Los Angeles County seen greater changes over time in motor vehicle emissions?#

#Subset data#

vehiclesubset <- grep("vehicle", SCC2$EI.Sector,value = T, ignore.case = T )
SCCvehiclesubset <- subset(SCC2, SCC2$EI.Sector %in% vehiclesubset, select = SCC)
baltcity.LA <- subset(NEI, NEI$fips == "24510" | NEI$fips == "06037")
NEIvehiclesubset <- subset(baltcity.LA, baltcity.LA$SCC %in% SCCvehiclesubset$SCC)
vehicleltotals <- aggregate(NEIvehiclesubset[c("Emissions")], list(fips = NEIvehiclesubset$fips, year = NEIvehiclesubset$year),sum)
vehicleltotals$city <- rep(NA, nrow(vehicleltotals))
vehicleltotals[vehicleltotals$fips == "06037", ][, "city"] <- "LA County"
vehicleltotals[vehicleltotals$fips == "24510", ][, "city"] <- "Baltimore City"

#Create plot#

#Plot 5: sum total vehicle emmisions for U.S.#

png("Plot6.png", width = 480, height = 480)
p <- ggplot(vehicleltotals, aes(x=year, y=Emissions, colour=city)) +
  geom_point(alpha=.5) +
  geom_smooth(alpha=.2, size=1, method = "loess") +
  ggtitle("Total Vehicle Emissions in Baltimore City and LA County")

print(p)

dev.off()



