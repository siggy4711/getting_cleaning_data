Getting and Cleaning Data Assignment

Version History:
Author: Eric van Mulken
Date: 21 June 2014
version: 1.0
Change: initial version


This project produces a summary per person(subject) and activity of that person on data used as in [Original Study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). For a description of the original study see Appendix A of this README.

Data is retrieved from a remote location at [Data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
The supplied data includes frequent observations on a 561 elements long feature vector, along the feature observations the activity at time of feature observation and subject performing the activity is available. As a requirement, of the 561-feature vector only features with "mean()" and "std()" in their name are kept for the summary, the kept features contain the measurements on the mean and standard deviation(over a timewindow), 66 features are kept. Feature names are supplied but are changed for better usuability in R, "()" is removed and "-" is replaced by "\_", eg tBodyAcc-mean()-X is changed to "tBodyAcc\_mean\_X". Also "avg_" is prefixed to indicate that the recorded features are averages, eg "avg\_tBodyAcc\_mean\_X".
Supplied data is partitioned in test and train data, the data is now departitioned by simply concatenating the train dataset at the end of the test data set. The concatenated data is grouped by subject and activity label and the mean of each of the 66 features per group is calculated. Finally activity labels are replaced by the corresponding activity names, the result is stored in the file uci_har_get_clean_summary.csv in the working directory.

## Repository Files
The following files are provided in the repository:
- run_analysis.R, contains the code for data intake and analysis
- codebook.md, codebook for the output of run_analysis.R
- README.md(this file)

## Prerequisites
- R installed, the plyr package is used and needs to be installed as well.
- remote file present and retrieveable, in case of problems first check/download [Data File](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- Disk requirements: size(remote file): 61 mB packed, 269 mB unpacked, total of 330 mB needed
- Memory requirements: on win7 amdx64 running the script kept memory usage well below 100mB

## Installation:
Apart from the components described in Prerequisites, the script run_analysis.R is selfcontained and no further installation steps are needed.
## Configuration:
the script run_analysis.R uses the current work directory for storing input data and output data. Change working directory on commandline or add a line to the script if a different working directory is desired, use setwd("\<your dir here\>"). No further configuration needed.
## Operations:
Run the script run_analysis.R, eg by executing the command "source("\<absolute path\>run_analysis.R")" in RStudio.
The outputted file can be read with the command "read.csv(file="./uci_har_get_clean_summary.csv")"

## Input:
no input file(s) needed, dataset is read from remote location.

The following files from the dataset of the original study are used:
- features.txt, list of all features
- activity_labels.txt, links the activity labels with their activity name, eg activity label 1 has name WALKING

- "test/X_test.txt" test set, featurevector observations,
- "test/subject_test.txt" test set subjects performing activity, only 1 column of integers in the range of 1 to 30
- "test/Y_test.txt" test set activity labels, only 1 column of integers in the range of 1 to 6

X_test.txt, subject_test.txt and Y_test.txt have the same number of rows, the files can be linked by the rownumber to retrieve the activity and subject for a featurevector observation

- "train/X_train.txt" train set, featurevector observations,
- "train/subject_train.txt" train set subjects performing activity, only 1 column of integers in the range of 1 to 30
- "train/Y_train.txt" train set activity labels, only 1 column of integers in the range of 1 to 6

X_train.txt, subject_train.txt and Y_train.txt have the same number of rows, the files can be linked by the rownumber to retrieve the activity and subject for a featurevector observation

#### Note: 
- Features are already normalized and bounded within [-1,1] in the dataset.

## Output:
run_analysis.R will output "uci_har_get_clean_summary.csv" stored in working directory,format:
- first row has columnheaders(names)
- separator is ","
- dimensions are 180 rows 68 columns.The columns consist of subject,activity and 66 features. The rows contain the normalised average(between [-1,1]) of the 66 features per subject per activity, there are 30 subject each performing 6 activities totaling to 180 rows. The subjects are identified by an integer in the range 1 to 30, activities are one of WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING
- size 220 kB

### Processing overview:
Running the script run_analysis.R will:
- read remote datafile "getdata_projectfiles_UCI HAR Dataset.zip" at [Data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip to directory "UCI HAR Dataset"
- read local files "UCI HAR Dataset/activity_labels.txt", "UCI HAR Dataset/features.txt".
- determine which features to keep,  the kept features have "mean()" and "std()" in their name
- Change featurenames for improved usability, () is removed and - replaced by _
- read test set data "UCI HAR Dataset/test/X_test.txt", "UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/test/Y_test.txt"
- read train set data "UCI HAR Dataset/train/X_train.txt", "UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/train/Y_train.txt"
- drop unneeded features from test and train featurevector observations, 66 features are kept in both data sets.
- for test data combine feature observations with corresponding subjects and activities, total columns is 68=1(subject)+1(activity)+66(features)
- for train data combine feature observations with corresponding subjects and activities, total columns is 68=1(subject)+1(activity)+66(features)
- row bind the test data and train data, ie append train data under test data
- summarize data by taking mean of features observations per subject/activity id, then replace activity label by activity name, prefix featurenames with "avg_"
- write the summarized data to the working directory, filename is "uci_har_get_clean_summary.csv"

## Appendix A
From the original study(README.txt in the dataset):

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.* 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.*

*For each record it is provided:*
- *Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.*
- *Triaxial Angular velocity from the gyroscope.* 
- *A 561-feature vector with time and frequency domain variables.*
- *Its activity label.*
- *An identifier of the subject who carried out the experiment.*"




