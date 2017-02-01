#Part 1
read.table("~/GitHub/IODS-project/data/learning2014.csv")
str(learning2014)
dim(learning2014)

#Part 2
# draw a scatter plot matrix of the variables in learning2014.
# [-1] excludes the first column (gender)
pairs(learning2014[-1])

install.packages("GGally")

# access the GGally and ggplot2 libraries
library(GGally)
library(ggplot2)

# create a more advanced plot matrix with ggpairs()
p <- ggpairs(learning2014, mapping = aes(), lower = list(combo = wrap("facethist", bins = 20)))
p
summary(learning2014)
