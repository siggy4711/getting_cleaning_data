This document describes the data layout and semantics of the file "uci_har_get_clean_summary.csv"

The dataset delivered by [Smartlab](www.smartlab.ws) as produced by the Human Activity Recognition study(HAR) is retrieved at [Data location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Forementioned dataset is then further processed, see [README.md](https://github.com/siggy4711/getting_cleaning_data/blob/master/README.md) for a description of the processing.

The data in the file uci_har_get_clean_summary.csv records the average of feature observations per subject/activity group. There are 30 subjects and each subject performs one of 6 activities so there are 30*6 = 180 groups(rows). There are 66 feature averages per group so a single row contains 68 values, these are the subject, the activity and the 66 feature averages.

## Featurenames
The featurenames are provided in the dataset of the HAR study in the file features.txt, a description is given in features_info.txt. The HAR study delivers a featurevector of 561 elements, as a requirement, of the 561 feature vector only features with "mean()" and "std()" in their name are kept when constructing "uci_har_get_clean_summary.csv", the kept features contain the measurements on the mean and standard deviation(over a timewindow), 66 features are kept.

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

The featurenames from the HAR study are slightly adjusted, for better usuability in R, "()" is removed and "-" is replaced by "_", eg tBodyAcc-mean()-X is changed to "tBodyAcc_mean_X". No further adjustment is done to keep the names as close as possible to the original names who are already descriptive.

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
the average of the features are already normalised in the HAR dataset to a mean of 0 and a range from -1 to 1 and are of type decimal eg -0.928444801702128  
tBodyAcc_mean_X  
tBodyAcc_mean_Y  
tBodyAcc_mean_Z  
tBodyAcc_std_X  
tBodyAcc_std_Y  
tBodyAcc_std_Z  
tGravityAcc_mean_X  
tGravityAcc_mean_Y  
tGravityAcc_mean_Z  
tGravityAcc_std_X  
tGravityAcc_std_Y  
tGravityAcc_std_Z  
tBodyAccJerk_mean_X  
tBodyAccJerk_mean_Y  
tBodyAccJerk_mean_Z  
tBodyAccJerk_std_X  
tBodyAccJerk_std_Y  
tBodyAccJerk_std_Z  
tBodyGyro_mean_X  
tBodyGyro_mean_Y  
tBodyGyro_mean_Z  
tBodyGyro_std_X  
tBodyGyro_std_Y  
tBodyGyro_std_Z  
tBodyGyroJerk_mean_X  
tBodyGyroJerk_mean_Y  
tBodyGyroJerk_mean_Z  
tBodyGyroJerk_std_X  
tBodyGyroJerk_std_Y  
tBodyGyroJerk_std_Z  
tBodyAccMag_mean  
tBodyAccMag_std  
tGravityAccMag_mean  
tGravityAccMag_std  
tBodyAccJerkMag_mean  
tBodyAccJerkMag_std  
tBodyGyroMag_mean  
tBodyGyroMag_std  
tBodyGyroJerkMag_mean  
tBodyGyroJerkMag_std  
fBodyAcc_mean_X  
fBodyAcc_mean_Y  
fBodyAcc_mean_Z  
fBodyAcc_std_X  
fBodyAcc_std_Y  
fBodyAcc_std_Z  
fBodyAccJerk_mean_X  
fBodyAccJerk_mean_Y  
fBodyAccJerk_mean_Z  
fBodyAccJerk_std_X  
fBodyAccJerk_std_Y  
fBodyAccJerk_std_Z  
fBodyGyro_mean_X  
fBodyGyro_mean_Y  
fBodyGyro_mean_Z  
fBodyGyro_std_X  
fBodyGyro_std_Y  
fBodyGyro_std_Z  
fBodyAccMag_mean  
fBodyAccMag_std  
fBodyBodyAccJerkMag_mean  
fBodyBodyAccJerkMag_std  
fBodyBodyGyroMag_mean  
fBodyBodyGyroMag_std  
fBodyBodyGyroJerkMag_mean  
fBodyBodyGyroJerkMag_std  