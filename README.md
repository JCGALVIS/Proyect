Getting and Cleaning Data Course - Project
========================================
This file describes how run_analysis.R script works.
* First download the following file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Second create a folder called project, unzip the file and pass the data found within UCI HAR Dataset.
* Make sure the folder "data" and the run_analysis.R script are both in the current working directory.
* Third, use the command in RStudio source("run_analysis.R").
* Fourth generates a file in the current directory called dataClean.
* Finally, use data <- read.table("dataClean.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.
