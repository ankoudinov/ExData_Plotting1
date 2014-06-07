plot1 <- function() {
    ## read the table from file for specified dates
    filetoread <- "../household_power_consumption.txt"
    data <- read.table(filetoread, sep=";", header=TRUE, colClasses="character")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    good <- data$Date=="2007-02-01" | data$Date=="2007-02-02"
    data1 <- data[good,]
    ## select data for the plot
    x <- as.numeric(data1$Global_active_power)
    
    ## create a plot
    png (filename="plot1.png",height=480, width=480)
    hist(x,col=2,xlab=" Global Active Power (kilowatts)",main="Global Active Power") 
    dev.off()
    
    return ("plot1.png is ready")
}
