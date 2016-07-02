#Exploratory Data Analysis Course Project 1 
#Exctracting and subsetting dataset
    dataFile <- "./data/hpc.txt"
    data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    
#Setting variables
    globalActivePower <- as.numeric(dataSubset$Global_active_power)
    globalReactivePower <- as.numeric(dataSubset$Global_reactive_power)
    voltage <- as.numeric(dataSubset$Voltage)
    datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    subMetering1 <- as.numeric(dataSubset$Sub_metering_1)
    subMetering2 <- as.numeric(dataSubset$Sub_metering_2)
    subMetering3 <- as.numeric(dataSubset$Sub_metering_3)
    
#Plot 1
    png("./data/plot1.png", width=1024, height=768)
    hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.off()

#Plot 2
    png("./data/plot2.png", width=1024, height=768)
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
    
#Plot 3
    png("./data/plot3.png", width=1024, height=768)
    plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
    dev.off()
    
#Plot 4
    png("./data/plot4.png", width=1024, height=768)
    par(mfrow = c(2, 2)) 
    #Top Left
        plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
    #Top Right
        plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
    #Bottom Left
        plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
        lines(datetime, subMetering2, type="l", col="red")
        lines(datetime, subMetering3, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
    #Bottom Right
        plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
    dev.off()