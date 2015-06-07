dataR <- read.csv(
  "household_power_consumption.txt",
  sep=";",
  dec=".",
  na.strings = "?",
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- dataR[(dataR$Date == "1/2/2007" | dataR$Date == "2/2/2007"), ]
data$uTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")



plot(data$uTime, data$Global_active_power, type="l" ,xlab="", ylab="Global Active Power(kilowatts)")


dev.copy(png,"plot2.png", height=480, width=480)
dev.off()

