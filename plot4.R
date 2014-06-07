plot4 <- function() {
    ## read the table from file for specified dates
    filetoread <- "../household_power_consumption.txt"
    data <- read.table(filetoread, sep=";", header=TRUE, colClasses="character")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    good <- data$Date=="2007-02-01" | data$Date=="2007-02-02"
    data1 <- data[good,]
    ## time data for the plot
    data1$DateTime <- as.POSIXct( paste(as.character(data1$Date), data1$Time))
    
    ## create a plot
    png (filename="plot4.png",height=480, width=480)
    par ( mfcol=c(2,2), mar=c(4,4,1,1))
    ## Plot 1
    plot (data1$DateTime, data1$Global_active_power,pch=NA, xlab=NA, ylab=" Global Active Power")
    lines (data1$DateTime, data1$Global_active_power)
    ## Plot 2
    plot (data1$DateTime, data1$Sub_metering_1, pch=NA, xlab=NA, ylab="Energy sub metering")
    lines (data1$DateTime, data1$Sub_metering_1)
    lines (data1$DateTime, data1$Sub_metering_2, col="red")
    lines (data1$DateTime, data1$Sub_metering_3, col="blue")
    legend ("topright", lty=1, bty="n", col=c(1,2,"blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot (data1$DateTime, data1$Voltage,pch=NA, xlab="datetime", ylab="Voltage")
    lines (data1$DateTime, data1$Voltage)
    
    plot (data1$DateTime, data1$Global_reactive_power,pch=NA, xlab="datetime", ylab=" Global_reactive_power")
    lines (data1$DateTime, data1$Global_reactive_power)
    dev.off()
    return ("plot4.png is ready")
}

