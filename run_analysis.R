# Getting and Cleaning Data COurse Project 

# Data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# download and unzip the file in the working directory

# This R script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 1. Merges the training and the test sets to create one data set

if (!require("reshape2")) {
    install.packages("reshape2")
}

if (!require("data.table")) {
    install.packages("data.table")
}

library(reshape2)
library(data.table)

# Reads X, y and subject data from train and test sets
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# merges the training and the test data respectively
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Reads column names from features.txt for X (X_train and X_test) and names x
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
colnames(x) <- features

# 2. Extracts only the measurements on the mean and standard deviation for each measurement

features_extracted <- grep("-mean\\(\\)|-std\\(\\)", features,value=TRUE)
x_extracted <- x[,features_extracted]

# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
y[,1] <- activities[y[,1], 2]


# 4. Labels the data set with descriptive variable names

# sets column names for y
colnames(y) <- c("Activity")

# sets column name for subject
colnames(subject) <- "Subject"

# creates a data set only containing measurements on the mean and standard deviation 
tidy_data1 <- cbind(subject,y,x_extracted)
# write data set to txt
write.table(tidy_data1, "tidy_data1_measurements_on_mean_and_std.txt",row.names = FALSE, quote = FALSE)

# 5. Creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject. 

data_melted <- melt(tidy_data1, id=c("Activity","Subject"))
tidy_data2 <- dcast(data_melted, Activity + Subject ~ variable, mean)

# write data set to txt
write.table(tidy_data2, "tidy_data2_averages_of_each_activity_and_subject.txt",row.names = FALSE, quote = FALSE)


