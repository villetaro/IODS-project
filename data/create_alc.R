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


