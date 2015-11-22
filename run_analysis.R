## download file and unzip in to working directory

if(!file.exists("./data")){dir.create("./data")}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataurl,destfile="./data/projectdata.zip",method="curl")
unzip(zipfile="./data/projectdata.zip",exdir="./data")

##Get the list of files

path_dat <- file.path("./data","UCI HAR Dataset")
filelist <- list.files(path_dat, recursive=TRUE)

##Read the data into variables

#Activity files
activitytest <- read.table(file.path(path_dat, "test" , "Y_test.txt" ),header = FALSE)
activitytrain <- read.table(file.path(path_dat, "train", "Y_train.txt"),header = FALSE)

#Subject files
subjecttest <- read.table(file.path(path_dat, "test" , "subject_test.txt"),header = FALSE)
subjecttrain <-read.table(file.path(path_dat, "train", "subject_train.txt"),header = FALSE)

#Features files
featurestest <- read.table(file.path(path_dat, "test" , "X_test.txt" ),header = FALSE)
featurestrain <- read.table(file.path(path_dat, "train", "X_train.txt"),header = FALSE)

## Merges training and test sets into one data set

# Combining data tables by rows
subjectdata <- rbind(subjecttrain, subjecttest)
activitydata <- rbind (activitytrain, activitytest)
featuresdata <- rbind(featurestrain, featurestest)

# Assign names to each variable
names(subjectdata) <- c("subject")
names(activitydata) <-c("activity")
featuredatanames <- read.table(file.path(path_dat, "features.txt"), head=FALSE)
names(featuresdata) <- featuredatanames$V2

# Merge columns to get the data frame for all of the data
combinedata <- cbind(subjectdata, activitydata)
alldata <- cbind(featuresdata, combinedata)

##Extract the measurements for mean and standard deviation for each measurement
subsetfeaturenames <- featuredatanames$V2[grep("mean\\(\\)|std\\(\\)", featuredatanames$V2)]
selectednames <- c(as.character(subsetfeaturenames), "subject","activity")
alldata <- subset(alldata, select=selectednames)

##Name the activities in the data set using descriptive names

#Read in descriptive activity names
activitylabels <- read.table(file.path(path_dat, "activity_labels.txt"), header=FALSE)

#Factorize variable activity in the data frame "alldata" using descriptive activity names
alldata$activity <- factor(alldata$activity);
alldata$activity <- factor(alldata$activity, labels=as.character(activitylabels$V2))

##Label the data set with descriptive names of features
#prefix t is replaced by time
#Acc is replaced by Accelerometer
#Gryo is replaced by Gyroscope
#prefix f is replaced by frequency
#Mag is replaced by Magnitude
#BodyBody is replaced by Body
names(alldata) <-gsub("t", "time", names(alldata))
names(alldata) <-gsub("f", "frequency", names(alldata))
names(alldata) <-gsub("Acc", "Accelerometer", names(alldata))
names(alldata) <-gsub("Gyro", "Gyroscope", names(alldata))
names(alldata) <-gsub("Mag", "Magnitude", names(alldata))
names(alldata) <-gsub("BodyBody", "Body", names(alldata))

##Creates an independent tidy data set
library(plyr);
Data2<-aggregate(. ~subject + activity, alldata, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
