library(sqldf)
fn <-  "household_power_consumption.txt"
data <- read.csv.sql(fn, sql = 'select * from file where  Date = "1/2/2007" or Date = "2/2/2007"',  header=TRUE, sep=";")

data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")
data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])

hist(data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.copy(png,"plot1.png", height=480, width=480)
dev.off()
