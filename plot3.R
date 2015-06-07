dataR <- read.csv(
  "household_power_consumption.txt",
  sep=";",
  dec=".",
  na.strings = "?",
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- dataR[(dataR$Date == "1/2/2007" | dataR$Date == "2/2/2007"), ]
data$uTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


plot(c(data$uTime,data$uTime,data$uTime), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(data$uTime, data$Sub_metering_1, col="black")
lines(data$uTime, data$Sub_metering_2, col="red")
lines(data$uTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))


dev.copy(png,"plot3.png", height=480, width=480)
dev.off()
