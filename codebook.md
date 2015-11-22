## CodeBook
This is a code book describing the varibles, the data, and any transformations or work performed.
#The data source
*The original data url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*The description of the original dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Dataset Information: (Summary)
*Experiments were carried out on 30 volunteers between the ages of 19-48 years of age.
*The group performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
*Using an embedded accelerometer and gryoscope, the 3-axial linear accerlation and 3-axial angular velocity at the constant rate of 50 Hz was measured.
*The experiment was video recorded to label the data manually.
For more detailed information regarding the execution of this experiment please see the description of the origina data set in the link above.

#The Data:
The data set includes:
*'README.txt'
*'features_info.txt'which shows information about the variables used on the feature vector.
*'features.txt' which lists all of the features.
*'activity_labels.txt' which links the class labels with the activity name.
*'train/X_train.txt' containing the training set.
*'train/y_train.txt' containing the training labels.
*'test/X_test.txt' containing the test set.
*'test/y_test.txt' containing the test labels.

#Transfromation details
There are 4 parts:
1. Merges the training and test sets together to create a single data set.
2. Extracts the mean and standard deviation for each measurement.
3. Names the activities in the data set using descriptive names and labels the activities.
4. Creates a tidy data set with the average of each variable for each activity and subject. 


