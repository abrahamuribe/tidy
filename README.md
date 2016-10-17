## Peer-graded Assignment: Getting and Cleaning Data Course Project
## abraham.u@gmail.com

# Geting and Cleaning Data

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Programs

This draft version of the R program was used

(used command version in R)
platform       i386-w64-mingw32            
arch           i386                        
os             mingw32                     
system         i386, mingw32               
language       R                           
version.string R version 3.3.1 (2016-06-21)

## Packages

The following packages must be installed

reshape2 
datatable 
chron

## Course Project

Steps for create one R script called run_analysis.R that with next steps

1.- Merges the training and the test sets to create one data set.
2.- Extracts only the measurements on the mean and standard deviation for each measurement.
3.- Uses descriptive activity names to name the activities in the data set
4.- Appropriately labels the data set with descriptive variable names.
5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Steps for execution 

1.- Download the data source and put into a folder in you pc this folder called  'DATA'
2.- In same folder  called  'DATA' will be execute the script R 'run_analysis.R'
3.- With help 'setwd() command R sets the working folder function called 'DATA' 
4.- Within the programa R run source("run_analysis.R")
5.- At the end of execution it is created in the same 'DATA' folder a file called 'ResultData.txt'



