# Getting and Cleaning Data Course Project

## Course Project

In this project, we will work on the "Human Activity Recognition Using Smartphones" data set. We will combine and clean the raw data to obtain a set of tidy data. 

The point of this project is to creative an R Script, called run_analysis.R, that will achieve the following:

1. Merge the training and test data sets to create one data set
2. Extract only the measurements on the mean and the standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in Step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Before running the run_analysis.R script
1. Download the .zip file from this URL - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the file and move the folder titled "UCI HAR Dataset" to your working directory

## Note: The R Script will install the use of two packages
1. data.table package
2. reshape2 package 

## The script will generate a new file in your working directory
The file titled, "tidy_data.txt" will contain the tidy data set


