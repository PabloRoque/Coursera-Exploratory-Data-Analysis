# plot 3
library(ggplot2)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

balt <- subset(NEI, fips == "24510")
baltTypeEm <- aggregate(balt$Emissions,
                        list(balt$year, balt$type), sum)
names(baltTypeEm) <- c("year", "type", "Emissions")

with(baltTypeEm, qplot(year, Emissions, col = type, 
                       geom = c("point", "path"), size=I(2),
                       main = "Total Emissions in Baltimore per type"))

# Export to png device
png('plot3.png', width = 480, height = 480, units = "px")
with(baltTypeEm, qplot(year, Emissions, col = type, 
                       geom = c("point", "path"), size=I(2),
                       main = "Total Emissions in Baltimore per type"))
dev.off()
