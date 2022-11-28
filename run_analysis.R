## 1. Merge the training and the test sets to create one data set

setwd("~/Desktop/R-programming-class/UCI HAR Dataset/train") #modify this to desired directory

train = read.table("X_train.txt", header=FALSE)
#dim(train) is 7352x561

trainSubject = read.table("subject_train.txt", header=FALSE)
trainLabels = read.table("y_train.txt", header=FALSE)

setwd("~/Desktop/R-programming-class/UCI HAR Dataset/test") #modify this to desired directory

test = read.table("X_test.txt", header=FALSE)
#dim(test) is 2947x561

testSubject = read.table("subject_test.txt", header=FALSE)
testLabels = read.table("y_test.txt", header=FALSE)

#Add subject ID and label ID to train data frame and the test data frame respectively
mergeTrain = cbind(trainSubject, train)
mergeTrain = cbind(trainLabels, mergeTrain)
#dim(mergeTrain) is 7352x563

names(mergeTrain)[1] = "Activity"
names(mergeTrain)[2] = "Subject"

mergeTest = cbind(testSubject, test)
mergeTest = cbind(testLabels, mergeTest)
#dim(mergeTest) is 2947x562

names(mergeTest)[1] = "Activity"
names(mergeTest)[2] = "Subject"

#Merge train and test datasets 
#Put test subjects below train subjects
mergeAll = rbind(mergeTrain, mergeTest)
#dim(mergeAll) is 10299x563

## 2. Extract only the measurements on the mean and standard deviation for each measurement

setwd("~/Desktop/R-programming-class/UCI HAR Dataset") #modify this to desired directory

features = read.table("features.txt", header=FALSE)
#dim(features) is 561x2 with 1 feature per row

#Extract only mean and sd values
ExtractCol = c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)
#added 2 columns to datasets Activiy Label and Sucject, so columns we want to extract are:
ExtractCol = ExtractCol + 2

subdata = subset(mergeAll, ExtractCol=c(1:2, ExtractCol))
#dim(subdata) is 10299x68

## 3. Use descriptive activity names to name the activities in the data set

subdata[,1]=gsub("1", "Walking", subdata[,1])
subdata[,1]=gsub("2", "Walking upstairs", subdata[,1])
subdata[,1]=gsub("3", "Walking downstairs", subdata[,1])
subdata[,1]=gsub("4", "Sitting", subdata[,1])
subdata[,1]=gsub("5", "Standing", subdata[,1])
subdata[,1]=gsub("6", "Laying", subdata[,1])

## 4. Appropriately labels the data set with descriptive variable names.

#Change column 3:68 names to variable names:
ExtractCol = ExtractCol - 2
colNames = as.character(features[ExtractCol,2])
names(subdata)[3:68] = colNames

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(dplyr) 
tidyData = tbl_df(subdata) 

#Group data by Activity and Subject
by_ActSub = group_by(tidyData, Activity, Subject) 
summaryDF = summarise_each(by_ActSub, funs(mean)) 

## 6. Creating a .txt file with the final data set

write.table(summaryDF, file="tidy_data.txt", row.names=FALSE)