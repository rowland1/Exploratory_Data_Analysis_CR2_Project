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

#Question: Across the United States, how have emissions#
#from coal combustion-related sources changed from 1999-2008?#

#Subset coal data#

coalsubset <- grep("coal", SCC2$EI.Sector,value = T, ignore.case = T )
SCCcoalsubset <- subset(SCC2, SCC2$EI.Sector %in% coalsubset, select = SCC)
NEIcoalsubset <- subset(NEI, NEI$SCC %in% SCCcoalsubset$SCC)
coaltotals <- aggregate(NEIcoalsubset[c("Emissions")], list(year = NEIcoalsubset$year),sum)

#Plot 4: sum total coal emmisions for U.S.#

png("Plot4.png", width = 480, height = 480)
p <- ggplot(coaltotals, aes(x=year, y=Emissions)) +
  geom_point(alpha=.5) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Total Coal Emissions in the U.S.")

print(p)

dev.off()
