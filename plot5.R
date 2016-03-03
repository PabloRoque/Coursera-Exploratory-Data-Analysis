# plot 5

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# String lookup.
motorRows <- grep(pattern="*[Mm]otor*", SCC$Short.Name)
# String to SCC code
SCCNEI <- SCC[motorRows,1]
# Subsetting rows matching *[Mm]otor*-SCC
motorNEI <- NEI[NEI$SCC %in% SCCNEI,]

# Subsetting Baltimore by fips
baltMotor <- subset(motorNEI, fips == "24510")

# Aggregate by year
baltMotorTotal <- aggregate(baltMotor$Emissions, list(baltMotor$year), sum)
names(baltMotorTotal) <- c("year", "Emissions")
# Plotting
with(baltMotorTotal, plot(year, Emissions, main = "Motor-related emissions in Baltimore"))
