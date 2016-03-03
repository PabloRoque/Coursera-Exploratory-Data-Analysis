# plot 1

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Aggregating by year
totEm <- aggregate(NEI$Emissions, list(NEI$year), sum)
names(totEm) <- c("year", "Emissions")

# Plotting using base
with(totEm, plot(year, Emissions, main = "Total emissions"))
