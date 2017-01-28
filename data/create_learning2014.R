# Name Ville Aro
# Date Saturday the 28th Januray

# Data Wranling, still chillin'

lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(lrn14)
str(lrn14)

# Data appears to have 183 observation of 60 variable. Lets look further :)
# With structure we can learn the different variables.

Analysis <- c("gender","age","attitude", "deep", "stra", "surf", "points")
lrn14 <- lrn14[ which(points > 0),]
str(lrn14)
lrn14 <- lrn14[ which(points > 0),]
newdata <- lrn14[ which(lrn14$"points">0)]

# see the structure of the new dataset

str(Analysis)
str(lrn14)

