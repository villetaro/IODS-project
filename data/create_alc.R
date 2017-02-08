#Name Ville Aro
#Date 08.02.2017
#Open data science, Exercise 3! 

# 1.3 Reading the data 

student_mat <- read.table("~/GitHub/IODS-project/data/student-mat.csv", header=T, sep=";", row.names=NULL)

student_por <- read.table("~/GitHub/IODS-project/data/student-por.csv", header=T, sep=";", row.names=NULL)

# Lets first look the student_mat dataset

dim(student_mat)
str(student_mat)

The dataset student_mat has 395 observations and 33 different variables.

# Then lets take a look at stundent_por
  
dim(student_por)
str(student_por)

The dataset studen_por has 649 observations and 33 different variables.
Both of these datasets have the same 33 variables.

# 1.4 Now we join the two data sets and then take a look at the structure again. Expecting some changes :)
colnames(student_por)
colnames(student_mat)

library(dplyr)

join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

student_por <- inner_join(student_mat, student_por, by = join_by, suffix=c("student_mat","student_por"))

colnames(student_por)

glimpse(student_por)

# 1.5 Compining the "duplicated" answers.

alc <- select(student_por, one_of(join_by))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(student_mat)[!colnames(student_mat) %in% join_by]

# print out the columns not used for joining
notjoined_columns

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(student_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- select(two_columns, 1)[[1]]
  }
}

# glimpse at the new combined data

glimpse(alc)

# Now we have 382 observations of 33 different variables.

# 1.6 Creating the high_use factor

alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

alc <- mutate(alc, high_use = alc_use > 2)

# 1.7 DONE! "The joined data should now have 382 observations of 35 variables" Check!
# Now we just save the data and part 1 is done!

glimpse(alc)

write.csv(alc, file = "alc.csv")
?write.csv
