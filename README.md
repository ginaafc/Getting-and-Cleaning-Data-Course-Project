# Peer-graded Assignment: Getting and Cleaning Data Course Project

Here I explain the analysis files in a clear and understandable way.

## Dataset

[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) you can find the data for the project and [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ) a full description available where the data was obtained.

## Files

These are the files you find in this repo:

  - **CodeBook:** Contain the description the variables, the data, and any transformations or work that I performed to clean up the data.

  - **run_analysis:** Contain the script for performing the analysis which was done in 7 steps describe in the Codebook and also in this script.

  - **data1:** Is the tidy data that I get after doing the following (not necessarilly in that order):(1) Merges the training and the test sets to create one data set; (2) Extracts only the measurements on the mean and standard deviation for each measurement; (3) Uses descriptive activity names to name the activities in the data set; (4) Appropriately labels the data set with descriptive variable names. 

  - **data2:** Is the another tidy data (based on data1) with the average of each variable for each activity and each subject.