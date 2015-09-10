data <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE)
data$Date<- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == ("2007-02-01")|data$Date ==("2007-02-02"),]
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3 <- as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$Voltage<- as.numeric(levels(data$Voltage))[data$Voltage]
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data<-cbind(data,datetime)

# Creates a PNG file with the plot in the Working Directory
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2)) 
with(data, {
  plot(datetime,data$Global_active_power,type="l"
       ,xlab = "",ylab = "Global Active Power")
  plot(datetime,data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
  plot.new()
  par(new=T)
  plot(datetime, data$Sub_metering_1, xlab="",ylab ="",ylim=c(0,max(data$Sub_metering_1)), 
       type="l", main="")
  par(new=T)
  plot(datetime, data$Sub_metering_2,col = "red", xlab="",ylab =  "", 
       ylim=c(0,max(data$Sub_metering_1)),type="l", main="")
  par(new=T)
  plot(datetime, data$Sub_metering_3,col = "blue", xlab="",ylab =  "Energy Sub Metering", 
       ylim=c(0,max(data$Sub_metering_1)),type="l", main="")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1,cex = 0.5)
  plot(datetime,data$Global_reactive_power,type="l"
       ,xlab = "",ylab = "Global_reactive_power")
 })
dev.off()