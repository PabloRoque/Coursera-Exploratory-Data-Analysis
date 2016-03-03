# plot 2

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Aggregating by year, only data with fips=24510
baltTotalEm <- aggregate(NEI$Emissions[NEI$fips == "24510"],
                         list(NEI$year[NEI$fips == "24510"]), sum)
names(baltTotalEm) <- c("year", "Emissions")
with(baltTotalEm, plot(year, Emissions, main = "Total emissions in Baltimore"))
