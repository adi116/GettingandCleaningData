# CODE BOOK

## BACKGROUND:

###About the Experiment:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For more details, see README.txt (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###About the Measurements:
The measurements come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

For more details, see features_info.txt (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###The data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##THE PROJECT:

The run_analysis.R script produces the following data sets from the original experiment data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):
- a tidy data set that contains the mean and standard deviation for each of the measurement described above
- a tidy data set based on the first data set with the average of each variable for each activity and each subject.

###Modifications from the original data set:
- subject, X, and Y data sets from a folder (test or train) were merged into one data set and assigns a descriptive activity label from activity_labels.txt
- the processed test and train data sets were then merged into one data set
- during the process, the column names has to be renamed to a proper variable name, '()' and spaces were replaced by dots. Duplicate column names were addressed by concatenating column number and column name. The column number was later removed once the duplicate columns have been removed.
- column names with '*BodyBody*' were replaced by '*Body*' to prevent any confusion with the column naming convention
- only the mean and standard deviation calculations are included in the output

###Data Dictionary:

- Subject	- The volunteer who performed the activity for each window sample. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
- Activity.Name	- The activity performed by a volunteer (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

#####*Use the following guide to derive the column headings description for each measurement:*
- t	- Time domain signal captured at a constant rate of 50 Hz
- f	- Frequency domain signals applying Fast Fourier Transform (FFT) to some of the signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
  
- BodyAcc	- Body acceleration 
- GravityAcc - Gravity acceleration
- BodyAccJerk - Body linear acceleration jerk
- BodyGyro - Body gyroscope
- BodyGyroJerk - Angular velocity jerk
- BodyAccMag - Magnitude of body acceleration signal
- GravityAccMag - Magnitude of gravity acceleration signal
- BodyAccJerkMag - Magnitude of body linear acceleration jerk
- BodyGyroMag - Magnitude of gyro signal
- BodyGyroJerkMag - Magnitude of angular velocity jerk
  
- mean - Mean value
- std - Standard deviation
  
- X - signal in the X direction
- Y - signal in the Y direction
- Z - signal in the Z direction

#####*For example:*
**tBodyAcc.mean...X** stands for the mean body acceleration for the time domain signal in the X direction 

###Full list of Column Headings
1. Subject
2. Activity.Name
3. tBodyAcc.mean...X
4. tBodyAcc.mean...Y
5. tBodyAcc.mean...Z
6. tGravityAcc.mean...X
7. tGravityAcc.mean...Y
8. tGravityAcc.mean...Z
9	 tBodyAccJerk.mean...X
10. tBodyAccJerk.mean...Y
11. tBodyAccJerk.mean...Z
12. tBodyGyro.mean...X
13. tBodyGyro.mean...Y
14. tBodyGyro.mean...Z
15. tBodyGyroJerk.mean...X
16. tBodyGyroJerk.mean...Y
17. tBodyGyroJerk.mean...Z
18. tBodyAccMag.mean..
19. tGravityAccMag.mean..
20. tBodyAccJerkMag.mean..
21. tBodyGyroMag.mean..
22. tBodyGyroJerkMag.mean..
23. fBodyAcc.mean...X
24. fBodyAcc.mean...Y
25. fBodyAcc.mean...Z
26. fBodyAccJerk.mean...X
27. fBodyAccJerk.mean...Y
28. fBodyAccJerk.mean...Z
29. fBodyGyro.mean...X
30. fBodyGyro.mean...Y
31. fBodyGyro.mean...Z
32. fBodyAccMag.mean..
33. fBodyAccJerkMag.mean..
34. fBodyGyroMag.mean..
35. fBodyGyroJerkMag.mean..
36. tBodyAcc.std...X
37. tBodyAcc.std...Y
38. tBodyAcc.std...Z
39. tGravityAcc.std...X
40. tGravityAcc.std...Y
41. tGravityAcc.std...Z
42. tBodyAccJerk.std...X
43. tBodyAccJerk.std...Y
44. tBodyAccJerk.std...Z
45. tBodyGyro.std...X
46. tBodyGyro.std...Y
47. tBodyGyro.std...Z
48. tBodyGyroJerk.std...X
49. tBodyGyroJerk.std...Y
50. tBodyGyroJerk.std...Z
51. tBodyAccMag.std..
52. tGravityAccMag.std..
53. tBodyAccJerkMag.std..
54. tBodyGyroMag.std..
55. tBodyGyroJerkMag.std..
56. fBodyAcc.std...X
57. fBodyAcc.std...Y
58. fBodyAcc.std...Z
59. fBodyAccJerk.std...X
60. fBodyAccJerk.std...Y
61. fBodyAccJerk.std...Z
62. fBodyGyro.std...X
63. fBodyGyro.std...Y
64. fBodyGyro.std...Z
65. fBodyAccMag.std..
66. fBodyAccJerkMag.std..
67. fBodyGyroMag.std..
68. fBodyGyroJerkMag.std..
