# plot 4

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# String lookup.
coalRows <- grep(pattern="*[Cc]oal*", SCC$Short.Name)
# String to SCC code
SCCNEI <- SCC[coalRows,1]
# Subsetting rows matching *[Cc]oal*-SCC
coalNEI <- NEI[NEI$SCC %in% SCCNEI,]

# Aggregating by year
coalEm <- aggregate(coalNEI$Emissions, list(coalNEI$year), sum)
names(coalEm) <- c("year", "Coal_Emissions")

# Plotting using base
with(coalEm, plot(year, Coal_Emissions, main = "Totla coal-related emissions"))


