This document describes the data layout and dataelements of the file "uci_har_get_clean_summary.csv"

## Introduction
The dataset delivered by [Smartlab](www.smartlab.ws) as produced by the Human Activity Recognition study(HAR) is retrieved at [Data location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Forementioned dataset is then further processed, see [README.md](https://github.com/siggy4711/getting_cleaning_data/blob/master/README.md) for a description of the processing.

The data in the file uci_har_get_clean_summary.csv records the average of feature observations per subject/activity group. There are 30 subjects and each subject performs one of 6 activities so there are 30*6 = 180 groups(rows). There are 66 feature averages per group so a single row contains 68 values, these are the subject, the activity and the 66 feature averages.


### File structure
run_analysis.R will output "uci_har_get_clean_summary.csv", stored in working directory,format:
- first row has columnnames
- separator is ","
- dimensions are 180 rows 68 columns.The columns consist of subject,activity and 66 features. The rows contain the normalised average(between [-1,1]) of the 66 features per subject per activity, there are 30 subject each performing 6 activities totaling to 180 rows.
- size 220 kB


## Featurenames
In the dataset of the HAR study the featurenames are provided in the file features.txt, a description is given in features_info.txt. The HAR study delivers a featurevector of 561 elements, as a requirement, of the 561 feature vector only features with "mean()" and "std()" in their name are kept when constructing "uci_har_get_clean_summary.csv", the kept features contain the measurements on the mean and standard deviation(over a timewindow), 66 features are kept.

I slightly adapted the explanation from the HAR study, quoted text in *italic*, taken from file features_info.txt the taxonomy of the feature names:

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.*  
*The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)*  
*The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).*  
*Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).*  
*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).*

*These signals were used to estimate variables of the feature vector for each pattern:*  
*'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

*tBodyAcc-XYZ*  
*tGravityAcc-XYZ*  
*tBodyAccJerk-XYZ*  
*tBodyGyro-XYZ*  
*tBodyGyroJerk-XYZ*  
*tBodyAccMag*  
*tGravityAccMag*  
*tBodyAccJerkMag*  
*tBodyGyroMag*  
*tBodyGyroJerkMag*  
*fBodyAcc-XYZ*  
*fBodyAccJerk-XYZ*  
*fBodyGyro-XYZ*  
*fBodyAccMag*  
*fBodyAccJerkMag*  
*fBodyGyroMag*  
*fBodyGyroJerkMag*  

*The set of variables that were estimated from these signals are:*
**
*mean(): Mean value*  
*std(): Standard deviation*  
*plus some more which are not relevant*  

The featurenames from the HAR study are slightly adjusted, for better usuability in R, "()" is removed and "-" is replaced by "\_", eg tBodyAcc-mean()-X is changed to  tBodyAcc\_mean\_X. Further "avg_" is prefixed for the featurename to indicate that the delivered value is an average. No further adjustment is done to keep the names as close as possible to the original names who are already descriptive.

Examples, from the featurenames of "uci\_har\_get\_clean\_summary.csv"  
"avg\_tBodyAcc\_mean\_X": avg for average, t prefix(after avg\_) means time domain, BodyAcc is acceleration body part, mean is the estimated mean from the signals(over a small time period), X is the X-axis  
avg\_fBodyAcc\_std\_Y: avg for average,f prefix(after avg\_) means frequency domain, BodyAcc is acceleration body part, std is the estimated standard deviation from the signals(over a small time period), Y is the Y-axis

Note: the semantics for features containing fBodyBody in the name are not given, probably one body too much. Nonetheless these featurenames are kept as is.

For the "uci_har_get_clean_summary.csv" file all feature observations are grouped by subject and activity, and for every feature(of 66) the average per group is calculated.

## Datadictionary "uci_har_get_clean_summary.csv"

The following columns(variables) are recorded in the same sequence as below.

subject:  
person performing activity at feature observation
integer in range 1 to 30

activity:  
activity performed at feature observation
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

Features:  
The features are of type decimal between [-1,1] eg -0.928444801702128
avg_tBodyAcc_mean_X  
avg_tBodyAcc_mean_Y  
avg_tBodyAcc_mean_Z  
avg_tBodyAcc_std_X  
avg_tBodyAcc_std_Y  
avg_tBodyAcc_std_Z  
avg_tGravityAcc_mean_X  
avg_tGravityAcc_mean_Y  
avg_tGravityAcc_mean_Z  
avg_tGravityAcc_std_X  
avg_tGravityAcc_std_Y  
avg_tGravityAcc_std_Z  
avg_tBodyAccJerk_mean_X  
avg_tBodyAccJerk_mean_Y  
avg_tBodyAccJerk_mean_Z  
avg_tBodyAccJerk_std_X  
avg_tBodyAccJerk_std_Y  
avg_tBodyAccJerk_std_Z  
avg_tBodyGyro_mean_X  
avg_tBodyGyro_mean_Y  
avg_tBodyGyro_mean_Z  
avg_tBodyGyro_std_X  
avg_tBodyGyro_std_Y  
avg_tBodyGyro_std_Z  
avg_tBodyGyroJerk_mean_X  
avg_tBodyGyroJerk_mean_Y  
avg_tBodyGyroJerk_mean_Z  
avg_tBodyGyroJerk_std_X  
avg_tBodyGyroJerk_std_Y  
avg_tBodyGyroJerk_std_Z  
avg_tBodyAccMag_mean  
avg_tBodyAccMag_std  
avg_tGravityAccMag_mean  
avg_tGravityAccMag_std  
avg_tBodyAccJerkMag_mean  
avg_tBodyAccJerkMag_std  
avg_tBodyGyroMag_mean  
avg_tBodyGyroMag_std  
avg_tBodyGyroJerkMag_mean  
avg_tBodyGyroJerkMag_std  
avg_fBodyAcc_mean_X  
avg_fBodyAcc_mean_Y  
avg_fBodyAcc_mean_Z  
avg_fBodyAcc_std_X  
avg_fBodyAcc_std_Y  
avg_fBodyAcc_std_Z  
avg_fBodyAccJerk_mean_X  
avg_fBodyAccJerk_mean_Y  
avg_fBodyAccJerk_mean_Z  
avg_fBodyAccJerk_std_X  
avg_fBodyAccJerk_std_Y  
avg_fBodyAccJerk_std_Z  
avg_fBodyGyro_mean_X  
avg_fBodyGyro_mean_Y  
avg_fBodyGyro_mean_Z  
avg_fBodyGyro_std_X  
avg_fBodyGyro_std_Y  
avg_fBodyGyro_std_Z  
avg_fBodyAccMag_mean  
avg_fBodyAccMag_std  
avg_fBodyBodyAccJerkMag_mean  
avg_fBodyBodyAccJerkMag_std  
avg_fBodyBodyGyroMag_mean  
avg_fBodyBodyGyroMag_std  
avg_fBodyBodyGyroJerkMag_mean  
avg_fBodyBodyGyroJerkMag_std  