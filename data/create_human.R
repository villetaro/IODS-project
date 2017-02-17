# Ville Aro
# 17.2.2017
# "Human development" and "Gender inequality"

# Human development
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv")

# Gender inequality
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", na.strings = "..")

# Structure
str(hd)
str(gii)

# Dimensions
dim(hd)
dim(gii)

# Summary
summary(hd)
summary(gii)

# Rename variables with shorter descriptive names
colnames(hd)
colnames(hd)[1] <- "HDI_rank"
colnames(hd)[2] <- "country"
colnames(hd)[3] <- "HDI"
colnames(hd)[4] <- "life_exp"
colnames(hd)[5] <- "edu_exp"
colnames(hd)[6] <- "edu_mean"
colnames(hd)[7] <- "GNI"  
colnames(hd)[8] <- "GNI_netrank"

colnames(gii)
colnames(gii)[1] <- "GII_rank"
colnames(gii)[2] <- "country"
colnames(gii)[3] <- "GII"
colnames(gii)[4] <- "mat_mort"
colnames(gii)[5] <- "adol_birht"
colnames(gii)[6] <- "parl_rep"
colnames(gii)[7] <- "edu2F"
colnames(gii)[8] <- "edu2M"
colnames(gii)[9] <- "labF"
colnames(gii)[10] <- "labM"

# Mutate the "Gender inequality" data and create two new variables. 

# The first one should be the ratio of Female and Male populations with secondary education in each country. (i.e. edu2F / edu2M)
gii <- mutate(gii, edu2F_edu2M = edu2F / edu2M)

# The second new variable should be the ratio of labour force participation of females and males in each country (i.e. labF / labM
gii <- mutate(gii, labF_labM = labF / labM)

# Join the two dataset using the variable Country as the identifier. Keep only the countries in both datasets.
library(dplyr)
hd_gii <- inner_join(hd, gii, by = "country")

# Call the new joined data human and save it in data folder.
write.csv(hd_gii, file = "human.csv", row.names = F)

dim(hd_gii)

