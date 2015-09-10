data <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE)
data$Date<- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == ("2007-02-01")|data$Date ==("2007-02-02"),]

data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
# Creates a PNG file with the plot in the Working Directory
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power, col = "red",main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)")
dev.off()