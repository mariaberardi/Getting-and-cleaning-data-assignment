## Original data source

The data used was collected from Samsung Galaxy S smartphones accelerometers during various activities. More details can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Transformations of the original data

The readme.md file contains instructions to run the provided R-script run_analysis.R to transform the collected data into a tidy data set. The run_analysis.R script does the following to the downloaded data:

1. Adds the subject number id to the train and test data sets.

2. Adds the activity id to the train and test data sets.

3. Merges the two created data frames into a single data frame.

4. Selects the feature variables of interest (mean and standard deviation measurements) from the merged data frame and adds them to a new data frame.

5. Substitues numeric activity ID with descriptive names.

6. Gives descriptive names to columns 3 to 68, which contain the mean and std data. Variable names are chosen according to the names provided in features.txt from the original data set. The "dplyr" package is used to group the data by activity and subject id. Mean of each measured variable are calculated According to the grouping thus obtained.

7. A .txt file with the tidy data set is created in the working directory.

## Tidy data set variable description 

The following variables are included in the tidy_data.txt:

Activity: Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Laying
Subject: Subject 1-30

The measured variables in columns 3:68 consist of gyroscope 3-axial raw signals. "-XYZ" refers to the signals in the X, Y and Z directions. For each of the XYZ-variables, the mean() and std() are indicated. For example, tBodyAcc-mean()-X is the variable for the mean value for the body acceleration in the X-direction. The values recorded in the tidy_data.txt are mean values of the described measurements.

Time-domain signals: tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag.

Fast Fourier Transform (FFT) produced values: fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag.
