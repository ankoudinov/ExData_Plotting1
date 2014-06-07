plot3 <- function() {
    ## read the table from file for specified dates
    filetoread <- "../household_power_consumption.txt"
    data <- read.table(filetoread, sep=";", header=TRUE, colClasses="character")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    good <- data$Date=="2007-02-01" | data$Date=="2007-02-02"
    data1 <- data[good,]
    ## time data for the plot
    data1$DateTime <- as.POSIXct( paste(as.character(data1$Date), data1$Time))
    
    ## create a plot
    png (filename="plot3.png",height=480, width=480)
    plot (data1$DateTime, data1$Sub_metering_1, pch=NA, xlab=NA, ylab="Energy sub metering")
    lines (data1$DateTime, data1$Sub_metering_1)
    lines (data1$DateTime, data1$Sub_metering_2, col="red")
    lines (data1$DateTime, data1$Sub_metering_3, col="blue")
    legend ("topright", lty=1, col=c(1,2,"blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
    return ("plot3.png is ready")
}

