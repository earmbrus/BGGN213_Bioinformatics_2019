#Class 5 Data Visualization

x <- rnorm(1000)
#How many things are in x?
length(x)

mean(x)
#Expected mean = 0

sd(x)
#Expected standard deviation = 1

#Summary function gives statistical summary of vector
summary(x)

#boxplot of data
boxplot(x)
hist(x)
rug(x)
hist(x, breaks = 3)
hist(x, breaks = 200)

#Section2A
read.table(file="bimm143_05_rstats/weight_chart.txt")

#Want to change header to TRUE so that variable names in header, first line of table is the values.
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)
#Print fixed table
weight

#Make scatter plot of data:
plot(weight$Age, weight$Weight)

#Make it a line plot
plot(weight$Age, weight$Weight, type = "l")

#Change the points to filled squares:
plot(weight$Age, weight$Weight, type = "o", pch = 15)

#Now make the squares 1.5x times normal size:
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5)

#Now make the line thickness 2x normal size:
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5, lwd = 2)

#Now change the axis limits between 2 and 10kg
plot(weight$Age, weight$Weight, type ="o", pch = 15, cex = 1.5, lwd = 2, ylim=c(2,10))

#Now label axes:
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5, lwd = 2, ylim=c(2,10), xlab = "Age (months)", ylab = "Weight (kg)")

#Now name the whole chart:
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5, lwd = 2, ylim=c(2,10), xlab = "Age (months)", ylab = "Weight (kg)", main = "Baby Weight with Age")

#Section 2B:
read.table(file ="bimm143_05_rstats/feature_counts.txt", header = TRUE, sep = "\t")

#OR...

read.delim(file = "bimm143_05_rstats/feature_counts.txt")

#Name this data "mouse"

mouse <- read.table(file= "bimm143_05_rstats/feature_counts.txt", header = TRUE, sep = "\t")

barplot(mouse$Count, names.arg=mouse$Feature, horiz = TRUE)

#Flip horizontal and vertical axis

barplot(mouse$Count, names.arg=mouse$Feature, horiz = FALSE)
par(mar=c(2.1, 11.1, 4.1, 1))
barplot(mouse$Count, names.arg=mouse$Feature, horiz = TRUE, las = 1, ylab = "Count", main = "Number of Features in the Mouse GRCm38 Genome")

#Section 3A: Add color

read.delim("bimm143_05_rstats/male_female_counts.txt")

mousemf <- read.delim("bimm143_05_rstats/male_female_counts.txt")

barplot(mousemf$Count, names.arg=mouse$Sample)

#Color it

barplot(mousemf$Count, names.arg=mouse$Sample, col = rainbow(10))

#Make male bars different color from female:

barplot(mousemf$Count, names.arg=mousemf$Sample, col = c("blue2", "red2", "green", "black", "orange"), las = 2)

barplot(mousemf$Count, names.arg=mousemf$Sample, col =rainbow(nrow(mousemf)), las = 2)
par(mar=c(2.1, 11.1, 4.1, 1))      
par(mar=c(6, 2, 4, 6))      
        