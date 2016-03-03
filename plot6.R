# plot 6

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# String lookup.
motorRows <- grep(pattern="*[Mm]otor*", SCC$Short.Name)
# String to SCC code
SCCNEI <- SCC[motorRows,1]
# Subsetting rows matching *[Mm]otor*-SCC
motorNEI <- NEI[NEI$SCC %in% SCCNEI,]
# Subsetting Baltimore and California by fips
comparMotor <- subset(motorNEI, fips == "24510" | fips == "06037") 

# Aggregate by year and fips
comparMotorTotal <- aggregate(comparMotor$Emissions,
                              list(comparMotor$year, comparMotor$fips), sum)
names(comparMotorTotal) <- c("year", "fips", "Emissions")

# Plotting using ggplot2
library(ggplot2)
with(comparMotorTotal, qplot(year, Emissions, col = fips, 
                       geom = c("point", "path"), size=I(2),
                       main = "Baltimore vs LA County motor-emissions"))
