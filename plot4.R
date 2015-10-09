library(sqldf)
library(datasets)

#This will download the file & unzip it in your work directory - check with getwd()
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=fileurl,destfile="./exdata_data_household_power_consumption.zip",method="curl")
unzip("./exdata_data_household_power_consumption.zip")

# conditional loading of data
df1 <- read.csv.sql("household_power_consumption.txt", sep = ";" ,"select * from file where Date in ('1/2/2007','2/2/2007')")
z <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df <- cbind(z,df1)
names(df)[1] <- "datetime"

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename="plot4.png", width = 480, height = 480,units = "px")
###### Plot4 #####
par(mfcol = c(2,2))

#Plot2
plot(df$datetime,df$Global_active_power,type = "l",ylab = "Global Active Power (kilowatt)",xlab = "", cex.axis=0.5)

#Plot3
plot(df$datetime,df$Sub_metering_1,type = "l",ylab = "Global Active Power (kilowatt)",xlab = "", cex.axis=0.5)
lines(df$datetime,df$Sub_metering_2, col = "red")
lines(df$datetime,df$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1) , col=c("black","red","blue"), bty = "n" )

#Plot Voltage
plot(df$datetime,df$Voltage,type = "l",ylab = "Voltage",xlab = "datetime", cex.axis=0.5)

#Plot Global Reactive Power
plot(df$datetime,df$Global_reactive_power,type = "l",ylab = "Global Reactive Power",xlab = "datetime", cex.axis=0.5)

dev.off()


