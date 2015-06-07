dataR <- read.csv(
  "household_power_consumption.txt",
  sep=";",
  dec=".",
  na.strings = "?",
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- dataR[(dataR$Date == "1/2/2007" | dataR$Date == "2/2/2007"), ]
data$uTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

     plot(data$uTime, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
     
     plot(data$uTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
     
     plot(c(data$uTime,data$uTime,data$uTime), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
     lines(data$uTime, data$Sub_metering_1, col="black")
     lines(data$uTime, data$Sub_metering_2, col="red")
     lines(data$uTime, data$Sub_metering_3, col="blue")
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
     
     plot(data$uTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Glaobal_reactive_power")
  

dev.copy(png,"plot4.png", height=480, width=480)
dev.off()


