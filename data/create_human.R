# Ville Aro
# 17.2.2017
# "Human development" and "Gender inequality"

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv",
               stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv",
                stringsAsFactors = F, na.strings = "..")

# Structure
str(hd)
str(gii)

# Dimensions
dim(hd)
dim(gii)

# Summary
summary(hd)
summary(gii)

# Renaming the variables at the datasets

hd_new <- c("HDI_Rank", "Country", "HDI_Cap", "Life_Expectancy", "Exp_education_years", "Mean_education_years",
            "GNI_Cap", "GNI.HDI_Rank")
gii_new <- c("GII_Rank", "Country", "GII", "Mat.mor_Ratio", "Birth_Rate", "Parlament.rep_", "Second.Edu_F",
             "Second.Edu_M", "Labour.Part_F", "Labour.Part_M")

colnames(hd) <- hd_new
# See that it worked;
colnames(hd)

# Doing the same to gii
colnames(gii) <- gii_new
colnames(gii)



library(dplyr)

#First variable: Edu2_Ratio
#   --> the ratio of Female and Male populations with secondary education in each country.

gii <- mutate(gii, Edu2_Ratio= Second.Edu_F / Second.Edu_M)

# Second variable:
#   --> the ratio of labour force participation of females and males in each country.

gii <- mutate(gii, Lab_Ratio = Labour.Part_F / Labour.Part_M)

# New variables
str(gii)


# Joining the data sets! Let's use the variable "country" as an identifier

human <- inner_join(hd, gii, by = "Country", suffix=c(".hd",".gii"))

colnames(human)
glimpse(human)

#  At this point, the joined data should have 195 observations and 19 variables.

dim(human)

# Last part: saving the data

write.csv(human, file="human.csv")


##########################################################33
## Chapter 5 begins here

library(stringr)

as.numeric(human$GNI_Cap)

str(human)
dim(human)

# Exclude unneeded variables: keep only the columns matching the following variable names (described in the meta file above):  
# "Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F"


keep_columns <- c("Country", "Edu2_Ratio", "Lab_Ratio", "Exp_education_years", 
                  "Life_Expectancy", "GNI_Cap", "Mat.mor_Ratio", "Birth_Rate", "Parlament.rep_")

human <- select(human, one_of(keep_columns))

colnames(human)

# It worked! (I calculated that we should have 9 variables now and that we do)

# print out a completeness indicator of the 'human' data
complete.cases(human)

# print out the data along with a completeness indicator as the last column
data.frame(human[-1], comp = complete.cases(human))

# filter out all rows with NA values
human_ <- filter(human, complete.cases(human))

# look at the last 10 observations of human
tail(human, n=10)

# define the last indice we want to keep
last <- nrow(human) - 7
last
# choose everything until the last 7 observations
human_ <- human[1:155, ]

# add countries as rownames
rownames(human_) <- human_$Country


#Removing the Country variable
human_ <- dplyr::select(human_, -Country)

str(human_)

#'data.frame':	155 obs. of  8 variables

#Saving the data again, for the last time!

write.csv(human_, file="human.csv", row.names = T)

# Aaaand we are done! Now to the analysis part!
