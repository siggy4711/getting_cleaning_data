getting_cleaning_data
=====================

repo for the coursera "getting and cleaning data" course

Version History:

Author: Eric van Mulken
Date: 21 June 2014
version: 1.0
Change: initial version


This project does a small analysis on the data provided as in [Original Article](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Installation:
the script run_analysis.R is selfcontained and no installation steps are needed.
## Configuration:
the script run_analysis.R uses the current work directory for storing input data and output data. Change on commandline or add lines to the script if a different working directory is desired, use setwd("\<your dir here\>")
## Operations:
Open the script run_analysis.R in RStudio, select all text and press <ctrl>+enter. Other means of running the script have not been tested.
The script assumes that the file on the remote server is present, if the script fails then check [Data location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
The outputted file can be read with the command "read.csv(file="./uci_har_get_clean_summary.csv")"

## Files
The following files are provided:
- run_analysis.R, contains the code
- codebook.md, description of processing and output file
- README.md(this file)





### Processing overview:
- read remote datafile [Data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip to directory "UCI HAR Dataset"
- read local files "UCI HAR Dataset/activity_labels.txt"(mapping activity id to activity label), "UCI HAR Dataset/features.txt"(feature names)
- read test data "UCI HAR Dataset/test/X_test.txt"(feature measure), "UCI HAR Dataset/test/subject_test.txt"(subject/person of corresponding feature measure), "UCI HAR Dataset/test/Y_test.txt"(activity performed during corresponding feature measure)
- read train data "UCI HAR Dataset/train/X_train.txt"(feature measure), "UCI HAR Dataset/train/subject_train.txt"(subject/person of corresponding feature measure), "UCI HAR Dataset/train/Y_train.txt"(activity performed during corresponding feature measure)
- drop unneeded colums from test and train feature measures, 66 columns are kept
- combine feature measures with corresponding subjects and activities, total columns is 68=1(subject)+1(activity)+66(feature measures)
- row bind the test data and train data, total columns still 68
- summarize data by taking mean per subject/activity id, replace activity id by activity label
- write the summarized data to the working directory, filename is "uci_har_get_clean_summary.txt"

### Processing detail
R-Script run_analysis.R which does the following:
- if not present then read remote file "UCI HAR Dataset.zip", unzip remote file in the current working directory
- read activity_labels.txt store in activity.labels
- read X_test.txt, subject_test.txt, Y_test.txt, store in test.set,test.subject, test.activity respectively, all files have the same nr of rows
- read X_train.txt, subject_train.txt, Y_train.txt, store in train.set,train.subject, train.activity respectively, all files have the same nr of rows
- read features from features.txt store in dataframe features
- determine which features to keep from dataframe features, select as required only those features that have mean() or std() in the fieldname these are measurements on the mean and standard deviation for each (base/derived) measurement, store result in features.keep
- change original fieldnames of the measurement data because the fieldnames contain characters that are troublesome when using in R, () is removed - replaced by _ , store result in features.keep.beautified
- keep a subset of 66 columns based on features.keep in dataframes test.set and train.set, store test.set.keep train.set.keep respectively
- add the data on subject and activity to the measurements data of the test data. subject_test.txt+Y_test.txt+Y_test.txt+test.set -> test.out with 68 columns
- add the data on subject and activity to the measurements data of the train data. subject_train.txt+Y_train.txt+Y_train.txt+train.set -> train.out with 68 columns
- merge(rbind) test.out and train.out, store result in complete.set
- calculate mean of mean measurement and mean of std measurement per subject/activity in complete.set store in complete.set.mean 
- replace the activity id's with activity labels for readability
- write the summarized data to the working directory, filename is "uci_har_get_clean_summary.txt"

Input size(remote file): 61 mB packed, 269 mB unpacked, total of 330 mB needed(windows)

Memory requirements: on win7 amd x64 running the script kept memory usage well below 100mB

Output data format of "uci_har_get_clean_summary.txt":
- first row has columnheaders
- separator is ","
- dimensions are 180 rows 68 columns
- size 220 kB






