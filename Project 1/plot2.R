data <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE)
data$Date<- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == ("2007-02-01")|data$Date ==("2007-02-02"),]
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data<-cbind(data,datetime)
# Creates a PNG file with the plot in the Working Directory
png(file="plot2.png",width=480,height=480)
plot(datetime,data$Global_active_power,pch = ".",xlab = "",ylab = "Global Active Power(kilowatts)")
lines(datetime,data$Global_active_power)
dev.off()