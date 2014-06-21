Getting and Cleaning Data Assignment

Version History:
Author: Eric van Mulken
Date: 21 June 2014
version: 1.0
Change: initial version


This project produces a summary per person(subject)/activity on the data provided as in [Original Article](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

From the original study(README.txt in the dataset):

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.* 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.*

*For each record it is provided:*
*- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.*
*- Triaxial Angular velocity from the gyroscope.* 
*- A 561-feature vector with time and frequency domain variables.*
*- Its activity label.*
*- An identifier of the subject who carried out the experiment.*"

For this project, as a requirement only 66 columns(features) of the 561 long featurevector are kept for the summary, the kept features contain the measurements on the mean and standard deviation(over a timewindow). Test and train data are concatenated to produce the summary. The run_analysis.R produces the mean of the 66 features per subject and activity.

The following files from the dataset are used:
- features.txt, list of all features
- activity_labels.txt, links the activity labels with their activity name

- "test/X_test.txt" test set, featurevector observations,
- "test/subject_test.txt" test set subjects performing activity, only 1 column
- "test/Y_test.txt" test set activity labels, only 1 column

X_test.txt, subject_test.txt and Y_test.txt have the same number of rows, the files can be linked by the rownumber to retrieve the activity and subject for a featurevector observation

- "train/X_train.txt" train set, featurevector observations,
- "train/subject_train.txt" train set subjects performing activity, only 1 column
- "train/Y_train.txt" train set activity labels, only 1 column

X_train.txt, subject_train.txt and Y_train.txt have the same number of rows, the files can be linked by the rownumber to retrieve the activity and subject for a featurevector observation

#### Note: 
- Features are normalized and bounded within [-1,1].


## Files
The following files are provided:
- run_analysis.R, contains the code for data intake and analysis
- codebook.md, codebook for run_analysis.R
- README.md(this file)

Input: no input file(s) needed, data is read from remote location.

Output run_analysis.R will output "uci_har_get_clean_summary.txt" stored in working directory,format:
- first row has columnheaders(names)
- separator is ","
- dimensions are 180 rows 68 columns
- size 220 kB

## Prerequisites
- R and RStudio installed
- remote file present and retrieveable, in case of problems first check/download [Data File](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- Disk requirements: size(remote file): 61 mB packed, 269 mB unpacked, total of 330 mB needed
- Memory requirements: on win7 amdx64 running the script kept memory usage well below 100mB

## Installation:
the script run_analysis.R is selfcontained and no installation steps are needed.
## Configuration:
the script run_analysis.R uses the current work directory for storing input data and output data. Change on commandline or add lines to the script if a different working directory is desired, use setwd("\<your dir here\>"). No further configuration needed
## Operations:
Open the script run_analysis.R in RStudio, select all text and press "\<ctrl\>+enter". Other means of running the script have not been tested.
The outputted file can be read with the command "read.csv(file="./uci_har_get_clean_summary.csv")"


### Processing overview:
- read remote datafile "getdata_projectfiles_UCI HAR Dataset.zip" at [Data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip to directory "UCI HAR Dataset"
- read local files "UCI HAR Dataset/activity_labels.txt", "UCI HAR Dataset/features.txt". Change featurenames for improved usability, () is removed and - replaced by _
- read test set data "UCI HAR Dataset/test/X_test.txt", "UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/test/Y_test.txt"
- read train set data "UCI HAR Dataset/train/X_train.txt", "UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/train/Y_train.txt"
- drop unneeded colums from test and train featurevector observations, 66 columns are kept in both data sets
- for test data combine feature measures with corresponding subjects and activities, total columns is 68=1(subject)+1(activity)+66(features)
- for train data combine feature measures with corresponding subjects and activities, total columns is 68=1(subject)+1(activity)+66(features)
- row bind the test data and train data, ie append train data under test data
- summarize data by taking mean per subject/activity id, then replace activity label by activity name
- write the summarized data to the working directory, filename is "uci_har_get_clean_summary.txt"







