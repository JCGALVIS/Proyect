##Step1. Merges the training and the test sets to create one data set.
setwd("C:/Users/juan/Dropbox/Coursera/Ciesncia de datos(Especializacion)/Getting and Cleaning Data/Week3/Assessments/Proyect")
getwd()

##Read file X_train.txt
trainX <- read.table("./train/X_train.txt")
dim(trainX)
head(trainX)

##Read file y_train.txt
trainY <- read.table("./train/y_train.txt")
table(trainY)

##Read file subject_train.txt
trainSubject <- read.table("./train/subject_train.txt")

##Read file X_test.txt
testX <- read.table("./test/X_test.txt")

##Read file y_test.txt
testY <- read.table("./test/y_test.txt") 

##Read file y_test.txt
testSubject <- read.table("./test/subject_test.txt")

##Combine trainX and testX
joinX <- rbind(trainX, testX)

##Combine trainY and testY
joinY <- rbind(trainY, testY)

##Combine trainSubject and testSubject
joinSubject <- rbind(trainSubject, testSubject)

# Step2. Extracts only the measurements on the mean and standard 
# deviation for each measurement.

##Read file features.txt
features <- read.table("features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinX <- joinX[, meanStdIndices]
names(joinX) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(joinX) <- gsub("mean", "Mean", names(joinX))
names(joinX) <- gsub("std", "Std", names(joinX))
names(joinX) <- gsub("-", "", names(joinX))

# Step3. Uses descriptive activity names to name the activities in 
# the data set

##Read file activity_labels.txt
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinY[, 1], 2]
joinY[, 1] <- activityLabel
names(joinY) <- "activity"

# Step4. Appropriately labels the data set with descriptive activity 
# names. 

names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinY, joinX)

# Step5. Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

subjectLen <- length(table(joinSubject))
activityLen <- dim(activity)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
write.table(result, "dataClean.txt")

data  <- read.table("dataClean.txt")
data[1:12, 1:3]

