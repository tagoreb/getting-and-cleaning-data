#### Getting And Cleaning Data - Course Project

### Introduction

The purpose of this project is to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

1.  Data collected from the accelerometers from the Samsung Galaxy S smart phone for the Project can be downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
    (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2.  A full description is available at the site where the data was obtained:  
    [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

created R script called run_analysis.R which does the following.

1.  Read all required datasets in to R.
2.  Merges the training and the test sets to create one data set.
3.  Extracts only the measurements on the mean and standard deviation for each measurement. 
4.  Uses descriptive activity names to name the activities in the data set
5.  Appropriately labels the data set with descriptive variable names. 
6.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
7.  Creates the local file average_data.txt.
