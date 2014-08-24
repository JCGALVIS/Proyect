Getting and Cleaning Data Course Project - CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

* The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The run_analysis.R script performs the following steps to clean the data:
    1. Read X_train.txt, y_train.txt and subject_train.txt from the "./train" folder and store them in trainX, trainY and trainSubject variables respectively.
    2. Read X_test.txt, y_test.txt and subject_test.txt from the "./test" folder and store them in testX, testY and testsubject variables respectively.
    3. Concatenate testX to trainX to generate a data frame, joinX; concatenate testY to trainY to generate a data frame, joinY; concatenate testSubject to trainSubject to generate a data frame, joinSubject.
    4. Read the features.txt file from the "./Proyect" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation.
    5. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
    6. Read the activity_labels.txt file from the "./Proyect"" folder and store the data in a variable called activity.
    7. Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.
    8. Transform the values of joinY according to the activity data frame.
    9. Combine the joinSubject, joinY and joinX by column to get a new cleaned data frame, cleanedData.
    10. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject.
    11. Write the result out to "dataClean.txt" file in current working directory.
