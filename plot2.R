plot2 <- function() {
    ## read the table from file for specified dates
    filetoread <- "../household_power_consumption.txt"
    data <- read.table(filetoread, sep=";", header=TRUE, colClasses="character")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    good <- data$Date=="2007-02-01" | data$Date=="2007-02-02"
    data1 <- data[good,]
    ## datetime data for the plot
    data1$DateTime <- as.POSIXct( paste(as.character(data1$Date), data1$Time))
    
    ## create a plot
    png (filename="plot2.png",height=480, width=480)
    plot (data1$DateTime, data1$Global_active_power,pch=NA, xlab=NA, ylab=" Global Active Power (kilowatts)")
    lines (data1$DateTime, data1$Global_active_power)
    dev.off()
    
    return ("plot2.png is ready")
} 

