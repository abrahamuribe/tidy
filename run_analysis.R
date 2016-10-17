## Peer-graded Assignment: Getting and Cleaning Data Course Project
## abraham.u@gmail.com
## The goal is to prepare tidy data that can be used for later analysis.
##
## Create one R script called run_analysis.R that does the following:
## 1.- Merges the training and the test sets to create one data set.
## 2.- Extracts only the measurements on the mean and standard deviation for each measurement.
## 3.- Uses descriptive activity names to name the activities in the data set
## 4.- Appropriately labels the data set with descriptive activity names.
## 5.- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# begin

# Table activity labels
TbActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Table features
Tbfeatures     <- read.table("./UCI HAR Dataset/features.txt")[,2]
g_Tbfeatures   <- grepl("mean|std", Tbfeatures)

# Tables X_test, y_test data and subject_test
TbX_test       <- read.table("./UCI HAR Dataset/test/X_test.txt")
Tby_test       <- read.table("./UCI HAR Dataset/test/y_test.txt")
Tbsubject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(TbX_test) = Tbfeatures

TbX_test = TbX_test[,g_Tbfeatures]

# Table Activity_Id labels
Tby_test[,2]          = TbActivityLabels[Tby_test[,1]]
names(Tby_test)       = c("Activity_ID", "Activity_Label")
names(Tbsubject_test) = "subject"

tdata <- cbind(as.data.table(Tbsubject_test), Tby_test, TbX_test)

# Tables X_train, y_train data and TBsubject_train
TbX_train       <- read.table("./UCI HAR Dataset/train/X_train.txt")
TBy_train       <- read.table("./UCI HAR Dataset/train/y_train.txt")
TBsubject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(TbX_train) = Tbfeatures

TbX_train = TbX_train[,g_Tbfeatures]

TBy_train[,2] = TbActivityLabels[TBy_train[,1]]
names(TBy_train) = c("Activity_ID", "Activity_Label")
names(TBsubject_train) = "subject"

trdata <- cbind(as.data.table(TBsubject_train), TBy_train, TbX_train)

data = rbind(tdata, trdata)

idlabels   = c("subject", "Activity_ID", "Activity_Label")
setdiflabels = setdiff(colnames(data), idlabels)
meltdata      = melt(data, id = idlabels, measure.vars = setdiflabels)

ResultData   = dcast(meltdata, subject + Activity_Label ~ variable, mean)

# write to file ResultData
write.table(ResultData, file = "./ResultData.txt")

#end