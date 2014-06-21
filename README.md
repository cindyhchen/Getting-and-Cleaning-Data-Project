# Getting and Cleaning Data Course Project

## Description of the Project

Create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Source data for the project

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Step to Run the Script

1. Download the source data and unzip it to your working directory. You will have '''UCI HAR Dataset''' folder in your working directory.

2. Put '''run_analysis.R''' to your working directory

3. Run '''source("run_analysis.R")''' in RStudio

4. Two tidy data sets will be generated in your working directory: 
   * tidy_data1_measurements_on_mean_and_std.txt
   * tidy_data2_averages_of_each_activity_and_subject.txt
   
## Files included in this repository

1. README.md
2. CodeBook.md
3. run_analysis.R
