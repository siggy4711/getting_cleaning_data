# script sets the working directory and expects the following data in the locations:
# <Working Directory>/UCI HAR Dataset/features.txt
# <Working Directory>/UCI HAR Dataset/test/X_test.txt
#  dataset on file size is 269 MB unpacked plus 61 MB packed, total 330 MB
# in memory data, test.set = 14MB, train.set 34MB, *.keep sets 5MB,  mem usage stays well under 100 MB on win7 x64

#test set length 2947, 561 columns
# train set length 7352
library(plyr)

setwd("F:/dload/coursera/Getting and Cleaning Data")
data.local <- "UCI HAR Dataset"
uri <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#use nrows = -1 for full file read
nrows <-  -1

if(!file.exists(data.local))
{  
  download.file(uri,"./dataset.zip", mode = "wb")
  unzip("dataset.zip")
}

#read feature names
features <- read.table("./UCI HAR Dataset/features.txt", sep=" ", stringsAsFactors = FALSE)
# keep only columns with mean() or std() in the name
features.keep <- grep("mean\\(\\)|std\\(\\)",features[,2])
#clean feature names , remove (), replace - by _
features.keep.beautified <- sapply(features[features.keep,2],function(nm)  gsub("-","_",gsub("\\(\\)","", nm)) )
names(features.keep.beautified) <- NULL

#read activity labels
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep=" ", stringsAsFactors = FALSE)

#read test set
test.set <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names  = features[,2], stringsAsFactors = FALSE, nrows = nrows)  
#read test subject
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE, nrows = nrows)  
#read test activities
test.activity <- read.table("./UCI HAR Dataset/test/Y_test.txt", stringsAsFactors = FALSE, nrows = nrows)  

#drop unneeded columns
test.set.keep <- test.set[,features.keep]

#combine dataframes into a single frame
test.out <- data.frame(test.subject,test.activity,test.set.keep)

#attach subject,activity,beautified names as columns names
names(test.out) <- c("subject","activity",features.keep.beautified)


#read train set
train.set <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names  = features[,2], stringsAsFactors = FALSE, nrows = nrows)  
#read train subject
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE, nrows = nrows)  
#read train activities
train.activity <- read.table("./UCI HAR Dataset/train/Y_train.txt", stringsAsFactors = FALSE, nrows = nrows)  

#drop unneeded columns, attach beautified names
train.set.keep <- train.set[,features.keep]

#combine dataframes into a single frame
train.out <- data.frame(train.subject,train.activity,train.set.keep)

#attach subject,activity,beautified names as columns names
names(train.out) <- c("subject","activity",features.keep.beautified)

complete.set <- rbind(test.out,train.out)
#sum(complete.cases(complete.set)==FALSE) renders 0 so no missing values

# compute the unweighted mean per measurement at subject;activity level
complete.set.mean <- ddply(complete.set,.(subject,activity), colMeans)

#attach the activity labels
complete.set.mean$activity = as.factor(complete.set.mean$activity)
levels(complete.set.mean$activity) = activity.labels[,2]

write.csv(complete.set.mean, file="./uci_har_get_clean_summary.csv",row.names=FALSE)



